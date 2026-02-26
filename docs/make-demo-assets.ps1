param(
	[Parameter(Mandatory = $true)]
	[string]$InputMp4,
	[string]$OutputGif = "docs/demo.gif",
	[string]$OutputImage = "docs/image.png",
	[int]$Width = 960,
	[int]$Fps = 10,
	[double]$StillAtSeconds = 2.0
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
	throw "ffmpeg not found in PATH."
}

if (-not (Test-Path $InputMp4)) {
	throw "Input video not found: $InputMp4"
}

$palette = Join-Path $env:TEMP ("labelmaker-palette-" + [guid]::NewGuid().ToString("N") + ".png")

ffmpeg -y -i $InputMp4 -vf "fps=$Fps,scale=$Width:-1:flags=lanczos,palettegen=max_colors=96:stats_mode=diff" $palette | Out-Null
if ($LASTEXITCODE -ne 0) {
	throw "Palette generation failed."
}

ffmpeg -y -i $InputMp4 -i $palette -lavfi "fps=$Fps,scale=$Width:-1:flags=lanczos[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=4:diff_mode=rectangle" $OutputGif | Out-Null
if ($LASTEXITCODE -ne 0) {
	throw "GIF generation failed."
}

ffmpeg -y -ss $StillAtSeconds -i $InputMp4 -frames:v 1 $OutputImage | Out-Null
if ($LASTEXITCODE -ne 0) {
	throw "Screenshot generation failed."
}

if (Test-Path $palette) {
	Remove-Item -Path $palette -Force
}

Write-Host "Generated:"
Write-Host " - $OutputGif"
Write-Host " - $OutputImage"

