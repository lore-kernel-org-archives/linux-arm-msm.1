Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E37427F8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530941; cv=none; b=Kg28ikr9tRuoMlaqXbUk2VtkqkGDijnluTGdGg4aOjE/9c/+p5eP0q2kOVUdfBDw0c7O02GNrHkD0LPojSM6kZDRM+4bAXzTGl9d10l5I4xOInN30R2Z9N7pH0HXJUAMtEeYc+HJvH+Hx6TqwKKPjxuPX3qrBdhiafm7ysXo+sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530941; c=relaxed/simple;
	bh=1WhcFFCK1nSusKDuOFIKICZ9vXxVNAa2Aq2SrhHduYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsUPNfkg3J4tQ71OLhxWq5lgo4uKzi0fmR0aJ3l3dqv1zMCZU68nUWMF8B/RX934Vp3vudx+ykkDdfswchp2gIwf72rM3y7kNA1SnnIh/8Y+b6EEUcl/ouXGVO7dDadOFzPMP8L/2uLOu90vPl/DO7ZiDTCm1NSKdm2J3TWRcI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQ7m3iUX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+yQMEmk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQ7m3iUX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+yQMEmk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fk2P3127765
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rq+boa5oTQk2I8M/ddgcq45q
	xDUI+/rzhlcu7btY2e0=; b=EQ7m3iUXdDEICWYkD+JjeHYBh+iNO+SkYOYlcAE9
	3nzJS1OX2h3Y7YXP5xj+Y29PHO3DrGd3OCqWCknm//OPDg3vQvLVOjDXjIH34qgD
	wLc4dbPJ/BvmmEXg1OufNTPzbqDuYe2w0Hjog2p803xozlG3V5WS4L27PjAojVPO
	l5yhbKPFaiebyIxbBQudfefedk6OSzuUP5Zlv0YxosL6DU8dxSlV1Dc5vRpe4HSO
	6dBZfIKFSIAV+AZJ5OdD6g7uDkIpef04iqiUHIdT6zyzzuK7qDmJGEnzZhMMu1ih
	BhbKmnbZ2d2qikrA/KAJZWcOxbYD+of0War1+LWKL7Ti9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d09g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:35:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so12581501cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530932; x=1787135732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rq+boa5oTQk2I8M/ddgcq45qxDUI+/rzhlcu7btY2e0=;
        b=Z+yQMEmkS2J/kxcp7LjwqntPOWkU+P7QO2NAlt7VvtMzZVzYreJxu/xLgFTVGf0Ph1
         W5f36WrUyVSd2dwYSQVWtNR4dQeBk8FBfkuhQUlOQIsihoTvTb4LrdSepfTbOQqAFuqW
         o1arg8WwA2lagT/w9Gy7aNV1BbLQwnuQqDuxo3hVaGmOhGhppOdHSE0TpJVXWPyqt2mf
         De7ty1mR36NtcvE0CvSaQzXnIqZDZjyt2ns8+PX5rXgeG5ceF5RiDVobxratpqSQ05vQ
         YzkL9ND688F4xJsDI9cevfM6Xo+UrFiR0ZIOplp3COUhgQB/XyLLAuhR/tNH2IuIzGsQ
         S4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530932; x=1787135732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq+boa5oTQk2I8M/ddgcq45qxDUI+/rzhlcu7btY2e0=;
        b=jRFioAYaI1edbWL2EFUTSKouGzhRmwYwS0glUOnI58YBg9ybRmNxn2yIbo/KK7fTXF
         b5oAqh5KZeeCMWw/P+Yoi9MwkI6WyXJYB4PMyrSi2oPpiP4S9OCk3tLbsqWh6ZHXplKn
         0G1eHedYxkCanTPhpS35ppwmeoIPP+nYBrwgq7FKN4QRjFimBRm/c81pTuvmY8r/r768
         HI6x9BE6ommyb6/CMtkjhw2bA+bdTW/Ut/yX80SwPqxy7Cai7YtSrybWh4ytftm7JW2R
         lhX0NUHkXspqIHWoBo2qqhjTWg3v5r0GUWaPlwRyxdoKaiJ0Ktisjnjcaxy70ujvOBXF
         SHFg==
X-Forwarded-Encrypted: i=1; AHgh+RqvRJoDo6yjeMCFJJwKOZnFMNvOKNFooZNBl6GzBGwlEuYkwMmg71AHxOq8ze651gmsbNAjw3bwmODdOkHr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jbRCQlq7AuC8wUmAEzdC5Ur8EorF5pYhm5LdDKUOQFEAaLDZ
	LTTfbClFcehZPts55N0lInSjS1wxYWinz4K01x1tu5iG8EEy+tnoYQ4BkVT/WXc9ByjyEaiyXib
	a/b74iwzXjAccfc0hZd1aw8d/N2Uu3KUVa/jMANy+0LcdvYS/Z68dBfg/77zK8Vl15Fv9
X-Gm-Gg: AR+sD137DQdGvMEAOB6B4QPW+O+OkduoX2DV7i2fWg3Z0K+q39y5QQxrKWWOY08Q3Is
	677Gq/p8Cdu2IdBb8eTlWIK8ug+dKS/qCI6myU5gfg7iQaME2e/DFAJ/P4yM0W422hveTag88k7
	kLo4ZKJe49zUvvPekdkgIFoE0jvPXSWWyKvylQDSRvh2yc4D1fjHJdmkmmE6yFyBBEc9svCD/Wx
	euKziUF2EQVywqTAcY2///kpkZg6mdbLfOi+TLBXBAySOveCHXK0VTU7ZP/to+BPi018ZEoAdL6
	FLhxlok8tnEKBfShLRPE5xDJUDAmF1adL2KnBvsdK84rwvpzSyddcLKZ4i+FewPEIImC867Vls+
	TdSQBXPK9IWcvcUM=
X-Received: by 2002:a05:622a:118f:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-52d64814310mr26340901cf.35.1786530932295;
        Wed, 12 Aug 2026 03:35:32 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-52d64814310mr26340381cf.35.1786530931701;
        Wed, 12 Aug 2026 03:35:31 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4c10asm6210369f8f.20.2026.08.12.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:35:30 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:35:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Message-ID: <jjihsxwtf3jhtk5jiq7hvauroo64uwtyjhrjjanvzlohyxvslg@ab53oqcijieg>
References: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
 <20260809-glymur-send-v3-2-2d1ed10e3a89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-glymur-send-v3-2-2d1ed10e3a89@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LJuZDuWNbpEt9rT1HChaea410jlrns2t
X-Proofpoint-GUID: LJuZDuWNbpEt9rT1HChaea410jlrns2t
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7c4c75 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6YzG1AjCc6vFv2poO3oA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX7DuiKYufiP1I
 jQWDnEJnL7H+NTICFJDBw+PaVxwkDLGdCTgWoNZHqGbilz+EQ0Ve5shrdbnxhFcAAXpnfQ1FJrn
 rVar1ZlHJrLEB7MqdxqChDBfSxj1Gy/Ftz4tCca8g4rwgQhxfIT8iOu35DLQDxSNNMUSBqn8CBg
 WmKpZKV4DSEYXs0whmv6tJv5X/LnsI+aPGcTzRTVW411AoUSdHMLKHC1vNyi8TkW66Clyscp8Y7
 aLYU5ONZrjGbWC2L5xQt7im4pNw7vl+h4Fikmbw6Tzk9KwTOrhH4jyIYUOcV3OlbqCvBLkbYV8x
 U+vIkUeIv3GgaI3hz+n9kOX5f2o/rTY5f67vLR+7cPQlQGZXTsxT2dBWoPsrdBccHFpR8QCxnyF
 llb6FH+0Yped/Uug61XJXUyhD0onBRUg67R82yYB910e8n7suuPaENhCiCBekGyDpf0MFu/jKs9
 Z9s0e4vEiDqz6F4buVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX6BzMTi8ztoF1
 U1OdoMctphlDqOiGfKNMD+AYblMLAvozligW1t5GBUIyxyG1qATTg5EJ2gAH83RSq2JbgzauNzv
 cmbGb8qg9PwwFqkwZR32q6bkIjbdUhM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120084

On 26-08-09 14:29:22, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis HDMI output
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture
>   - real-time clock
>   - compute DSP (cDSP)
> 
> The HDMI jack is driven by a power-only DisplayPort-to-HDMI LSPCON on
> the usb_2 combo-PHY DP lanes rather than being a third USB-C port; HPD
> is on gpio126. The LSPCON is on an I/O sub-board with no I2C/AUX control
> path, so it is modelled with the generic simple-bridge "parade,ps185hdm"
> compatible used by the in-tree x1e80100 HDMI-bridge boards (the exact
> bridge part is unconfirmed) and it needs CONFIG_DRM_SIMPLE_BRIDGE.
> 
> The &gpu/&gmu enable, the audio nodes and &remoteproc_soccp opt into
> glymur.dtsi SoC nodes that are still in-flight; those series are
> declared as prerequisites in the cover letter.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>

With the comment from Gopikrishna addressed, this looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
