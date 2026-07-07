Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4296E3C9438
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408371; cv=none; b=DLHH6fmOzcKClCYYFVoXc6Ria/+GMHvMcZxxiJ5LiwGgUlGFvaGsW1V9/nVSmf9cRgW/HfHh+c61wDj/0yi9SdJLHSADDD4lahqfEQYTvYMJnvD4G+28BKjc7AvfcvYgYZeeH4wr592QZS4NnJOfYd/Hh3b/hcu4hAUeShbZ0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408371; c=relaxed/simple;
	bh=ipDzK7euD7eJOdng8Kug1BKrrgzjtJMdV45pG7Y0khA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmO5ZHYjEszJPNZeondzsGed8aOLkHLSZACVgQnrIjEriiGUuEvqJ0ie7WlOTcrHtjPnav6yikDTW+DzfOiHcy4yaz5h7wEydjBFeQwC/iXuhHbYldLgIg2OP9gA+ZjhqDOW67m9Mv1qfVB9dVZkfR9A/2r9/o3JioNjAPYjEIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQHSR+Ys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+5Oq2EU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQHSR+Ys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+5Oq2EU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748dcF2585204
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SCbttV0skIDHUqvl2VroCHVb
	jJ0V51s+CD/3Mvid91M=; b=PQHSR+Yssphk7iPh3OtR+k58HzN5ouZIYET+XpFY
	244T09V6y3A7TxLo9Y5k8xPuHAMZovOvVOXy2GM9UgWJzhimETE8eJEAbijF7eN5
	QruSweu3TJfr06N8PBMSrYyBhJ5b0RRANBr/7vnhVVl0TPlS3a+WCX/rA9appB/J
	9LojIU/KlwKMnsgQLbQQJq6I7tkfXJ1X5XN6eIzYgoAMsO1BpTyh3RL+Taa9C2tu
	fMcrMNhDx3M0/3r24mfDHAAnSGhdKTT71x+gI7b99zbmQ0UKxZlxSxrjgxoJUS+A
	qc01TME3aiQ93sszKUetJceW+G6j3OT7e6bMJrO+1bjHfA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t158p03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:12:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so10844659a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783408365; x=1784013165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCbttV0skIDHUqvl2VroCHVbjJ0V51s+CD/3Mvid91M=;
        b=W+5Oq2EU/1zzmKC6jvVCe0nu1wpBBV5dUWR9Zm22u9cqQCZBKpHy7kvDw2dDaj5TYn
         7L+AdVwk+OcFmpQkz0XQ3bQtMbih3NItkeyx/Li3V1iMcWfla4DUEMyQxugen/Tal+nx
         2OP6chHz4ax+OROH+uIMpTYb7J73A0zR56Wqu0zVpqXoPdwXwWT/9CEPmavXD+EdxzJy
         Nl49WS8xmns4UoDnUIREn8oGogm7HFRb8G+MQ/vEhbprwJbsRd+2sHA7GBxVy8UbSqTd
         N7tmzy/OcHKuQMFzNbgOd+A7STjV4uV/6GSwdIvwxv12UVZCezS0RCYXBCr1uOoIjosU
         /y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408365; x=1784013165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCbttV0skIDHUqvl2VroCHVbjJ0V51s+CD/3Mvid91M=;
        b=X3E+/gxxi13LTqhHI7NFizwfEz7hPFBi8qI8qNnqbS6vbem53ytzobOdc/gSMGxFjP
         Cedqg81+dbDgTu93/gKTp/MR1MmRWrEl2DvlLvj+Hvqe49oF+j1VYxTdLuqE+uRs0mLS
         zY4j8vdTN7qFRiSEtCVjNmeBxcecWF68Lq1zJpYq7RFnPDM9Yzh39fc6lFdXqHEBxLYE
         G9iwf9tLPe7bX42h0kYYZuPqj5/lIDafEm+GDSJTEXmzHE4blQFnXwNCAbYvaOsO5E+W
         USNkNxkQHz5+yCMqVUgllqyhwDEzyvuefKTQ17K9hpbp+vuzWPnCgZdrf5MuHuj4WZz9
         2+rw==
X-Forwarded-Encrypted: i=1; AHgh+RqGOXQH7dHoiJ0+2bIXw9sK0CNEOtQ5RJxtGJTLILmLawq4nN7OSCSm6SRs4Ii1hMYWfAvQxlgncUlRfzC3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14ItU0/wkAIQt3sab9vFbmW35266IE4H9BDmTqUanLVQf8glp
	c52sekwaZZypCYxywLssOdeU1E+Rr3ul/rikO/Ao7hMTkPd1Vy4/2L49uqUXiLCqqWPyvymBBli
	gJyJESGagai6rLeMZ0TX+3jfmP0Wb0246IqijVZ3TxcPaVizYHkzaV63+N9PH8ZLGjf25Rp/J/f
	ky
X-Gm-Gg: AfdE7cnyWZ+IZTZH652DwM5OqJjZhqyuCYZf45zYmp3wtpkUNxDO9cevlvJiPPe/Fjf
	1OARx3auY7DnVcrwOgPkfx2UUpiXNep3tj3nUVm+iMa7O0neQp7fOJBpsKErXAovr1gEFfTfe6B
	T991kpOner0D2uRtIEmQP+tSgJxII0eoqUAGQhc9qgi3cH3IllrInaozuTmw/01+BHVdV0znkbc
	3KOeIJTNC6fjyUt1jRLCsPSESxfmJYfETYQddrouqLQp81sosOjudH4hKKDqobe9ajU3ToSDgIs
	0sIJcL7r4p7vRh9wYEF3I6NflDlTCz5f16mdP46rD35GIpC9RosSkVgKzDGm0ID5yoU0MvsW1io
	wh6eEKNzpKMrxkvncScUjEym0czY0goNemozr4Q==
X-Received: by 2002:a05:6a21:62c8:b0:3bf:6363:11ec with SMTP id adf61e73a8af0-3c08ee3733dmr4777216637.34.1783408364801;
        Tue, 07 Jul 2026 00:12:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3bf:6363:11ec with SMTP id adf61e73a8af0-3c08ee3733dmr4777179637.34.1783408364170;
        Tue, 07 Jul 2026 00:12:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8bc08sm6225199eec.24.2026.07.07.00.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:12:43 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:42:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v9] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260707071236.7cyumdjhq4x2mo7c@hu-mojha-hyd.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
 <zj7y2enw2owu4oidbxc5qhilmbb7uzp2fhlawapuqlvhh45omi@5j25uydqolks>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zj7y2enw2owu4oidbxc5qhilmbb7uzp2fhlawapuqlvhh45omi@5j25uydqolks>
X-Proofpoint-GUID: eNmaBAUvWZCmHI_Sbqgm6A1odfDVK5rf
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4ca6ed cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ElO3I3FmCtZpy0SBe3cA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: eNmaBAUvWZCmHI_Sbqgm6A1odfDVK5rf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2OCBTYWx0ZWRfXwS78SPzIjnrG
 9D6xWuc6TejhaL3mhaHVZ9AS8+Sxbp2eQSxC0tsUnCc95gPf+g8f9IjrkOD0jDLsIzQ8bPN9EBz
 4qY398HXTJ7HeJzbfyE6iAbGika667Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2OCBTYWx0ZWRfX4btqWtzpnTpF
 bFQhftNNwGxooJhBPcCIJHk7cODG1jvih1+tRhnCRfOlLGOQ8hOWVmgUEMVlp0nX5MvpYQmDeDN
 ehDFDnl2dnJaDtGx9qfZaqfUV5y1Osem3RQV/yjGgxWT8XmDz9OUD8diPPcN9l+B4GRZH1Bp+fO
 fLjRuIdopLktPw/uTSYAY1NxxwXjl32p7aNQCKtrIv01+Ms0CwcgQm3i+9ijBBM5YAXO95bJMOJ
 KknwsMvQXiRE9PovLP2vqFA2GKCv1/MPavr3YiLGVsTPYn6YKlUcyTUFeJ+0SSEDjx7EapE88ie
 /fMlc89nmU6iua9v8m0fcymx+twPGcmPkLMPANiL+EED6En45Sti7iF0JeUy2L9cbc64DNe2whl
 TSkXwLwqhwg6NcsTJgfqxBz6HjuJcDzkB0XL/dQb7m8skJqolsINK8CP8MfLk1EVAZxVYZ73E1l
 ypeYgwFEB2pNPBEO7zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070068

On Mon, Jul 06, 2026 at 10:42:53PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 09:44:28PM +0530, Mukesh Ojha wrote:
> > All the existing Kodiak board variants run the Gunyah hypervisor, which
> > means Linux can only boot at EL1 on those devices. It is possible to
> > boot Linux at EL2 on these devices [1].
> > 
> > When running under Gunyah, remote processor firmware IOMMU streams are
> > controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> > consumer of the DeviceTree. Describe the firmware streams for each
> > remote processor in the EL2 overlay.
> > 
> > Add an EL2-specific DT overlay and apply it to Kodiak IoT variant devices
> > to create -el2.dtb for each alongside the standard dtb.
> > 
> > Note that modem and media subsystems are not yet supported due to
> > missing support are not there. For GPU to work, zap shader is
> > disabled. In EL2 mode the kernel owns the hardware watchdog,
> > which is enabled here. For WiFi, the wlan_ce_mem and wlan_fw_mem
> > regions are needed by the WCN6750 firmware.
> > 
> > Remove the erroneous deletion of wlan_ce_mem from qcm6490-idp.dts
> > and qcs6490-rb3gen2.dts as this is device memory and should be
> > present even for EL1 configurations, whether or not the
> > underlying OS uses it.
> > 
> > [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> > 
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
> >  - Remove reserve memory change of adding copy engine device
> >     memory back in el2  overlay file instead do not remove
> >      wpss ce device memory from el1 configurations for idp 
> >      or rb3gen2 device tree. [Miaoqing ]
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > new file mode 100644
> > index 000000000000..37a906218d17
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > @@ -0,0 +1,41 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * Kodiak specific modifications required to boot in EL2.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&gpu_zap_shader {
> > +	status = "disabled";
> > +};
> > +
> > +&remoteproc_adsp {
> > +	iommus = <&apps_smmu 0x1800 0x0>;
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	iommus = <&apps_smmu 0x11a0 0x0400>;
> > +};
> > +
> > +&remoteproc_mpss {
> > +	status = "disabled";
> > +};
> > +
> > +&venus {
> > +	status = "disabled";
> > +};
> > +
> > +&watchdog {
> > +	status = "okay";
> > +};
> > +
> > +&wifi {
> > +	status = "okay";
> 
> Hmm, don't. The platforms doesn't necessarily has the WiFi enabled.

Are you saying, let us rely on what is coming from the base upon
which this overlay is being applied.

> 
> > +
> > +	wifi-firmware {
> > +		iommus = <&apps_smmu 0x1c02 0x1>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > index bdc02260f902..6ab1bbdc0a62 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > @@ -25,7 +25,6 @@
> >  /delete-node/ &adsp_mem;
> >  /delete-node/ &cdsp_mem;
> >  /delete-node/ &video_mem;
> > -/delete-node/ &wlan_ce_mem;
> 
> Separate commit.

Sure.

> 
> >  /delete-node/ &wpss_mem;
> >  /delete-node/ &xbl_mem;
> >  
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha
