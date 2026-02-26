import * as extensionConfig from '../extension.json';

const IFRAME_ID = 'label-maker-pro-window';

export function activate(_status?: 'onStartupFinished', _arg?: string): void {}

export async function openLabelMaker(): Promise<void> {
	if (!eda?.pcb_PrimitiveImage || !eda?.pcb_MathPolygon || !eda?.pcb_Event) {
		eda.sys_Dialog.showInformationMessage(
			eda.sys_I18n.text('Label Maker Pro is only available in PCB editor.'),
			eda.sys_I18n.text('Label Maker Pro'),
		);
		return;
	}

	await eda.sys_IFrame.openIFrame('/iframe/index.html', 580, 780, IFRAME_ID, {
		maximizeButton: true,
		minimizeButton: true,
	});
}

export function about(): void {
	eda.sys_Dialog.showInformationMessage(
		`${eda.sys_I18n.text('Label Maker Pro v', undefined, undefined, extensionConfig.version)}\n${eda.sys_I18n.text('Create silkscreen labels with cutout text.')}`,
		eda.sys_I18n.text('About'),
	);
}
