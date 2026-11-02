Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590338;
	b=IyYfZaKm/HrtwRCQ+Q+/PogTxpn4G+taBUAAD7o3uyr16hhhSXwcq2kQ32Dq6WxmlKHW
	 rNGurSVLe5RvOZjtJaEbR45hoSNmC6482BZUmI/bNAdlzBCCcK2bxLsdjxpz4RxnNvsAK
	 g89AF93zv2hgvnHTY7/wMo992ZIkfcqrEayMfj6Kk5qotwCfaat+GejAnCzgVfWS6BX6Q
	 1V1aau20cmQWb1Y/hvSECvzeaH2Nqoxlmy+CHzh5eMIMk4OOSvaHpMg0Jjmhe5Mdjs8dv
	 sxl79tY9IDnqC6yAr3bbxoCn1+P0X3EqKvZ/Vb9siC5AaClvBJaVpa3yHIzfTc2JSmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V4Vra6fQtcjS2bOHJ4vISu/T87zL26GOtMaue5+rq5I=;
	b=hf5OhD99Epma+vwXd0HuMnreg4mZ+qUxV8pwKb+KsJvuiDPV42ySHYTqSumAQH52tic8
	 1Wxf6UHFrnIVvXNi/xVV9xwepY4TbIvAvnYDaqDfBJEqyzK9bAcyovFAUvE4X5zqh+97/
	 IavZHsafxciUE46EBM3NKgxVeCb3FItwO6U03FpuF4mDvl3CoS9ec1h9RyXj2X7jBpsRQ
	 kNlPvcigZZIyBuqSghbeRnMXpWsV/2VQcGS9IXnEyG1CFTLBm6+ezjkTf4zgXGaKMYRVE
	 CnEryow9sQyBsTrmfMJ+NcqBYNrZ7SDuc7izTysGFPITEy8+nZKPQKhAaG1Vy9/tehA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Jtub3uo/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1WkYBda;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7192B606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 03:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7192B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jtub3uo/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1WkYBda
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20K88q2288467
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 03:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V4Vra6fQtcjS2bOHJ4vISu/T
	87zL26GOtMaue5+rq5I=; b=Jtub3uo/eIAoGU4zHgJ4tpO6pWa9BHZJ3HCrlOg1
	fp6ewqqjBikhw41zxoPNCazflbBMTq4AH2vnklMiDWwINzfxU4Uorj2luR+LbfFl
	ppjzUfXNNLtukv4mkqkg5KDPoqktKpsPVAilXnXi2CtdYjBlxoq+wJR4bE5ZvAis
	0v6jgKmBqE+fM43oZOh5hIBfcr1ihqICwbwHxdTPhZiUr/YNtU9Mp3Nsz0dGML1r
	uAilxBiM/x3DBuMaIs9o7WFQfc9zvYjIwGe/B3CZn8/pkZNz1WAh7/o0+ajILbGv
	pdC0KLKfg5EIkFZRvnL61a4mDZBshPskz21YDAh9qUGaug==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8ducy7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:32:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so2748738c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 19:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793590336; x=1794195136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V4Vra6fQtcjS2bOHJ4vISu/T87zL26GOtMaue5+rq5I=;
        b=V1WkYBdaGilv8yNeBa9rm0X9T9yFa6coXaVXwf1bdOOz5ZMYyYsX5cfQeY+BMVQkHl
         iQJZKoLMnl5Se2L6/9qynHRI1y1OpvrF0Hcc/yfAuuuqXI1v3oYqKpX2iuS9iKUhdMVh
         ETSD8q1OUuZmDfzVgqitQp8uujwSWfgirzjxyoWXFME4JhOxlDGQrBjZBMN8iTW6eUE4
         b+PHgLNJhzK7OW110pllHVMgnNUfW9iYSzunDmAxtCWblG5kzo9O2gaeSUP65DVZd/kE
         1jZxRRMyBunMSqlwD7Veo7/GpVipNj221llzSQNc3Jm3bAlVkX4on8v+U1hvYbHZCrmR
         lhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590336; x=1794195136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4Vra6fQtcjS2bOHJ4vISu/T87zL26GOtMaue5+rq5I=;
        b=ng7payR93JRFsokX8QMLY39KxFhQfrdIYHcAPMzNcogec/C0HfL5/DEyXozSs4Ziuv
         E1dvE+HbRabfSiySOFh7aropqo3f70bOceKJ5QbvhFFTQxdt6wGwaukTfCes05fbpk6a
         otSXMhjAXEnxPChgEQgRvny4qTVmFgcx0Td4EVg/sdwGuGzOfoCBXn79fPiHNhA42d1Z
         3diJyiUCE3QUdFTJHb99liQPPfJsNDI9UGVKzrxOLPSjVNM3Wl6xKJEhz3utl+oGWhXb
         4bWTyL1qb/Z0l9g4jU+4T9kB42uvYblU5wLsiCsPNPfyp+7t8m2V/5Uigrwi9m6jgObj
         LC6g==
X-Forwarded-Encrypted: i=1; AKwUvBylbLazyWY2aBvLoDlSOi7ymMkgHfWOytiatdzakxiftN2ZGOeQbZFyVX9XN8uD8uonKzBW6QCFDv8mV8C3@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ6XTrnR98wk3HcnI0W4zvpYaV6/JDmKpfxi8s4GaH7y+1ngcG
	aMCgdd4pSXrXCYlcOnc4V9nauXp1q1DtadOXCR7Lg8JHbFl2q81FJcyknVIJ2MnprgIIyziiYOz
	omSMj5cxUbSpf06IMcD2vJOTjM6rwKBw4hCzr3zAJfSMqBpVkWAOPib2WDC5V1MVBb6jG
X-Gm-Gg: AYBFou1CnevhZJnkUGgpx/pUEiYpXiumPQhkVKVaYyfOng7T8zYtHo0TJ2lQ7YMC+fB
	JrYE9dxcmN0AnY/oAnGcsTyOAi53B57UE3NLekhZMI+HdLH6IOa+ULi3i198l5uZhmL4bBa7Zfw
	awpaJSXhjvmWUWsQ4/pzpwfNkKWDYbpYk3ias1N61Tn+Hn24INbqH8Jc4rqA9S8BNK0mI4RW1zk
	n6o3wxdfXPVwFBMPQ14btzwGnZ/yyVxIUkZse2HVr1/if7sdOqSKqSojoB87MIedgYM0XXSa2UX
	uKnhl14ximRtm8iqyeKRq9F/Ya1SbOI3x7uvR3jnBjjefNzsDLGK3kERr7sJTrjRK1Vxvideo7x
	p9aqhPeKR3t455CfdXnszrY1/qvd0bfcnBgV+/rjjs0dvNKwJb4icWiGplvtvUGD90ZxpIHWcJ8
	87JNOzsNmrhqwBRuHEjhkg
X-Received: by 2002:a05:7022:1108:b0:199:4f68:7710 with SMTP id a92af1059eb24-1ac55774becmr11915331c88.2.1793590335767;
        Sun, 01 Nov 2026 19:32:15 -0800 (PST)
X-Received: by 2002:a05:7022:1108:b0:199:4f68:7710 with SMTP id a92af1059eb24-1ac55774becmr11915309c88.2.1793590335163;
        Sun, 01 Nov 2026 19:32:15 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm27427782c88.12.2026.11.01.19.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:32:14 -0800 (PST)
Date: Sun, 1 Nov 2026 19:32:12 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Support broken suspend for
 SA8255P
Message-ID: <augEPIcTyepgTxFW@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3a4bdffa9101fa81e4511d84c5a3ddd0b972efe2.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a4bdffa9101fa81e4511d84c5a3ddd0b972efe2.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae80441 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=PcBk4QqV-VHVs7bFY3sA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: ITgvvHm3G4_RmFogmFbRe5eKW2-cXNqH
X-Proofpoint-GUID: ITgvvHm3G4_RmFogmFbRe5eKW2-cXNqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxMyBTYWx0ZWRfX+GnBEr0WFH0G
 CvKC0i9cOFEkH9SnSRr3lops16yTqlQNKNB8ALvevl7eEa5hkCMZtlxKwDtNdgqu6Nx+eRivA9g
 27NfEwj2z+3xTQavKTFoehSNxlkvZlSZB3d4kdXi0+ZzbbNIvqxE6/vyELUwT+RpnVKeHo/k/iL
 MqjlEGfO5N6UVwIdj9+VHhqbvnF0dCNYH+CSupDBZGGlBOBW3Z4Cfi3yD4iAMaC08VSNszaAhdE
 YCwqBl5KnUK55/Yuonj5gaEIozbmLO2OcNkUElN2dfxuAakqTr8NCwD/ual6d/0Og2dlnKuS5H0
 iZpTQKGMEEXahaak1IRP14qWilSgJ2wt08/msSiDIKH2xQktlq54pa4ktSoYGBODFc1mK/KZcjP
 4ntxsqHItYY72+WUU4NCScW2kWERAxXIJChWcxEGMWpBQgr+fROiWP2jNiDjIF6QD47rJfD4taj
 DDg6PSC2uOm2eh9BNww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxMyBTYWx0ZWRfX0Lu0h4HGQ2Zb
 SL3Xm5bQLnu9+nOLmpa9EgdtG/C/aKHlizeKjRk/Dy/XDXRy5GmdadRyxd52fQuaQJz9nsjdLQS
 EzL9gUdauLFrqXEn4AJclFyiCUpNy+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020013

On 26-10-29 00:29:35, Faisal Hassan wrote:
> During APPS Suspend, the clock controller unit disables all clocks
> to the CPU and subsystems, causing the controller to enter the
> Power-On Reset (POR) state. This results in the loss of
> Qscratch programming.
> 
> Upon APPS Resume, the USB controller does not have the proper
> PIPE_UTMI_CLK_SEL or VBUS_VALID. Hence, if only the High-Speed
> PHY is used for a controller capable of SuperSpeed operations,
> the controller will assume it should use the USB3 PHY and not
> the HS PHY as configured before APPS Suspend. This behavior
> disrupts the normal operation of the USB controller. Similarly,
> if the controller was operating in device mode prior to
> APPS suspend, and VBUS_VALID signal is not set after APPS resume,
> this will cause the PHYs to transition into the suspend state.
> This behavior disrupts the normal operation of the USB controller.
> 
> Address the issues by ensuring that the PIPE_UTMI_CLK_SEL and
> VBUS_VALID are handled properly after the system resumes from
> APPS Suspend. This is crucial for maintaining the correct
> operational state of the USB controller and preventing
> unintended suspensions of the PHYs.
> 
> Also, as the controller is starting from POR state, make
> sure the controller Reset is performed.
> 
> Because the controller is reset on every system resume, the
> Qscratch restore is done whether or not wakeup was enabled, and
> dwc3 core is told via needs_full_reinit to fully re-initialize the
> core on system resume even in host mode with wakeup enabled. Wakeup
> on this platform comes from the PHY interrupts routed through PDC,
> not from the controller staying powered. VBUS_VALID is only forced
> outside host mode, matching what probe does.
> 
> The XHCI controller is reset by the same event, so also set the
> xhci_reset_on_resume dwc3 property. dwc3 passes it on to the xhci-plat
> device as xhci-reset-on-resume-quirk, which makes xhci-plat set
> XHCI_RESET_ON_RESUME.
> 
> Also make the .prepare callback return 0 on these platforms. A
> runtime-suspended device in device mode would otherwise be left in
> place across system sleep (direct_complete), skipping the system
> resume callback and with it the reset and Qscratch restore.

Faisal, there are several issues in this patch, would you try to split them?
- XHCI_RESET_ON_RESUME quirk support for dwc3
- PIPE_UTMI_CLK_SEL restore after system resume, there is a similar submission recently [1]
- VBUS override restore after system resume
- The improvement for system resume dues to HW POR or lost of power.

[1]: https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/

> 
>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
> @@ -86,6 +90,13 @@ struct dwc3_qcom {
>  	struct icc_path		*icc_path_apps;
>  
>  	enum usb_role		current_role;
> +
> +	bool			broken_suspend;
> +	bool			ignore_pipe_clk;
> +};
> +
> +static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
> +	.broken_suspend		= true,
>  };

Why you consider it is "broken", or is it a normal resume recovery due to lost of status
for controller and PHY? Why other SoCs don't need it?

>  static int dwc3_qcom_prepare(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	/*
> +	 * The controller loses power across system suspend, so the system
> +	 * resume callback must always run to reset and reprogram it. Don't
> +	 * let the PM core leave a runtime-suspended device as-is.
> +	 */
> +	if (qcom->broken_suspend)
> +		return 0;

Why we need this? I see dwc3 core do dwc3_core_init_for_resume at device mode
during the resume.

>  
>  	return dwc3_pm_prepare(dwc);
>  }

-- 

Thanks,
Peter Chen
