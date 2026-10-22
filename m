Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684421;
	b=Nsnr12K121ttKST+hmgh03nV3n4ZuQoy+hX2EToiw6j9A6ALpdcUALY0PSBkymgb4HP+
	 u5obR7g+kXRpCHOfMUJ/JFdNMRB+6iF2nDJN5EbHNMOoYFnuQtP4tkAkxddo+oPMiUDzz
	 jMyTsgBGuRFRSGRkDrXekhqmSjLRdfBggOAfi8QJQg/iSVrevqY/vK4GR6Csls6bkjQFy
	 /HzVj5RlDMk2998hAewtugEB+IaPWtDUQDq0PKwg5Vt1l01wL50GOdI+w5HthnCsN6ktc
	 1kpx5AtMbAwrnNGrIhBa1xuggtzNWqBpfYiPGa+JFbPigTwnCvfo+3ssqMyeVQjaL8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YnrR2nv+E++a1n7gcEZCRuy8BYssAp+zlEpZEr5SoWQ=;
	b=1N48lT0pf9xMzoFcYzopH2QujOHwT0kcYQRHIWFwLUlszVXKj6ldHPZzoDCc5W/miD2b
	 49PWyxjt973jAl1QoNV21Oga6zx8QA/CkAiR9PdKqryGp31X2uHAtuK/wfYEkrCLJzWuJ
	 6njfN5y0ycy2ao3mv+J6Vgul8v+ppedyvPPW0w9pgGGGtz/MX3C25JX+HZsUtyLYeVpBF
	 /PpKaUJKYDHBfcVi42BRQBJ+Z3dVO5UqqgW7Avoa23yjon1Cg3qq7EMUUPWieUwiujRii
	 yx8kQHD+QlNFAF4Uhue6VQ/BPY6k70SKb27Wbxv2LGzY58T27ruDVs0BhHhA17r6lnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRAM0fzz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPzThDW6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877EB606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 15:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 877EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRAM0fzz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPzThDW6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFE3B4115438
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 15:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnrR2nv+E++a1n7gcEZCRuy8BYssAp+zlEpZEr5SoWQ=; b=dRAM0fzziD+TMvKh
	PJUzQUWyv0qh0oUF62rO6FLa5NtPq8Mo+5cUp6Fecga9ufUdz3f2DuzSTxd+WJQd
	+dcn1H4zNUJZPuCbkU3aKF7JRLVOPghoFrAYMYe5PB/4COfnDIbiWSV+4+XGJXsA
	2+M9Th7ezgJa/Qe5e6/8fjeLK6BiULQt1E+7zjWoDWeTS+EwgvsMEEgtVKPR2HFc
	7dTUfKIUZQDgk2VAvEqZCzV0u71N47xCzFgbBoIZkiYAFtMBkXkSpfKr+r1FUK7z
	oPL0zzb7mhSqpAH6K/oscXLGeF29mzcAv63pPxeVfYjBFLrUfGpEXyltrdWTjBTf
	eAnMDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a4bmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 15:53:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so42350085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792684413; x=1793289213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnrR2nv+E++a1n7gcEZCRuy8BYssAp+zlEpZEr5SoWQ=;
        b=IPzThDW693B6gXrcuAF0fDIJOKz+p85HydW8DMXNCOf4l0CzDH1CMsJtuMLhOpX2oR
         ICvVfz7V0gxymI30WuPP3uoUSiqp0ojx1QcYG7VWqY2w02tLgELAt+n5zCd53bnNJUX1
         hcIGO064XdNLAhGSeRv+AHiTjYH7/amR3ITNV/EBnkqW1ICZmXz+6LnzzBFyMDd8yxv+
         wOs5EyjfParmGl1ZnUPpU7naMrhmLWUYT+2/17P/FXk0+fs5cNcuXGgvEssmZYJ9lRQs
         TA5IsuOwuXtAk3WwP47oYS5b2MT8HgAPSNlcdJtdHHv3i8WQIGuK8XOZk5cGip8EjeBF
         YflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684413; x=1793289213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnrR2nv+E++a1n7gcEZCRuy8BYssAp+zlEpZEr5SoWQ=;
        b=JDcToWaVKiNfNv+w58MzttYNWWhnd7w6uNhzqyrRr/2z8PtdMgEZwabmoKH5IJ7K13
         QiHKOlhw9CI2BqJqOBMkEUYP9k2jKt7itaJRgmEPACJz+ASzGUUJkDAHsvsc7WsW25UG
         79OeiIY2itdz0Ezc4nVTscLipICAtrWM9KAjsyenQyXIftQ88UVuB0+cFjkYAMtV6obN
         FMkChNiZcJyZpVBukWS1WxfzV5G6VKqqJS02vQJaDdrswznIgZN623YeYnLYbrrxCG0l
         xeJAxd/Q3dLY1YjCPR9U1mlW5P+Z5ZrNPqQh3+Ensuj+mzC5kTkq/ALXButSmh43B29q
         LaNg==
X-Gm-Message-State: AFq9FYKo0KwnEa0TvPRo7/qUWpYDTOVtNbCcC9Nt+G2DFPjPbQG6Rhu9
	iBwuW13WaK82Icum/EIvFKAhHwI/qmdcAHZrlE9ZFr748T7+WWSq0LdqdTaPPFInOVvri+hldli
	njRP1kJDgSDlbHVD7a00ZCV+/sfp6qf+o1JoZaSMHWkiMuZW8i/M0UrAfDJST3WNPLkrBM/f4YT
	hQ
X-Gm-Gg: AYBFou04V6jYfQTBs3CNhQyxWtUio5+FfBEgx6Ryi4nkPWMtDBfVZh0trRLBHtTOqHx
	L6p0LFtUzGDZteHD9uIBm8tP7LPsxgMM9UGi6rcZkC9pKnmfd/Mb4RldlduRsdBssuzakmZrZln
	tatowyArzn1KLMeEegKtcRoViSpcsklyMlbWs3IsFYx/7KTttfCEEE7JHg/P7c/IkS+AFALYRZf
	erW/mydB563Vr3bl+LODKJFr1tR1DURdxEk68n1P/mRsthgfKzOPWjaoViSKIZQ4DDwLBU5IPIV
	dsB1ds3bos+rhbZvqLA6dbgQ9WC1d6nNrrVp4sLIRA35pjGw4k1lp0lsJXYTFP4LQdwGh+G9cnW
	mTRn1vWWO2vk3p01MJl+7Eg==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr1170113085a.2.1792684412547;
        Thu, 22 Oct 2026 08:53:32 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr1170109185a.2.1792684412062;
        Thu, 22 Oct 2026 08:53:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5ce8ca6sm1162566b.67.2026.10.22.08.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:53:31 -0700 (PDT)
Message-ID: <c78304c6-f553-4537-909c-de37c09e72c4@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:53:28 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] phy: qualcomm: qmp-combo: Extract common DP PHY
 init sequence
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2MyBTYWx0ZWRfX5dNfu7i0boQv
 c4CyXtL/sR01px2b0HjJ4YljOioSTzIabc5VFT9dtjSWh6DGXJ2COLAGHuuqwgSq1YF9cqPvaWm
 sxN+K3m33fRH01/CWDSROcCrEvllDN2vaz/s39Ldg8TSEbjwnydmkfUt2AGt0LibR1TQt55tY83
 F3Qm3eRLg+NPiIzlVsTyKHuNyG3zxaLa+q0K5I0hzqNDAuhlqK73nSZDsX0OAlno5gSWecwwljl
 Hz53sW03Oku+SRKOXn1iKDNe8PO7shVVlApgwTJrGTKWTM1srmYqfIrZa4zBDNePPrCInTyV5Z8
 ra7DQVgwFLsSPvt7j36PauOOY3FVyjB+p6SeXVq5rStUB/fRtQlQF89Z5HZECTt3tS2NUC+0cLg
 Fz6Flep7Q4OdGHUT1x5pQfLDHnxjzxwLbRWwBxX9/0vSfuymI3zBCABoVbqWpbp8H5hZrc3ddGz
 XgEDl2NaBAJyi0shSnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2MyBTYWx0ZWRfX7TYnllTbfZj0
 ikgv6GtLE3SNTMBdmv7mPQd6t/ghhTOmlBoPLWd8rqxywWOmqB47MX3L/KBUGg+l2q13vS/ClRM
 l3E86b3gVc31dLFDqIK2D10tYrP2bR0=
X-Proofpoint-GUID: Hi5aagOYIMHpLYeVmKWnxdKe5OBGCXxW
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada317d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=G15zOZzxmr7XqyTgzFkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Hi5aagOYIMHpLYeVmKWnxdKe5OBGCXxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220063

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Extract the common DP PHY initialization sequence shared between
> qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy() into a new
> qmp_combo_configure_dp_phy_common() function.
> 
> The common sequence covers:
> - Validation that dp_aux_cfg2 is configured for the platform
> - Writing dp_phy_cfg1 and dp_aux_cfg2 hardware-specific register values
> - Calling configure_dp_mode() for TypeC lane orientation
> - Programming AUX_CFG1, TX lane control registers
> - Invoking configure_dp_clocks() callback
> - PHY_CFG reset/enable sequence
> - Polling COM_C_READY_STATUS and COM_CMN_STATUS for PLL lock
> 
> Refactor qmp_v456_configure_dp_phy() to call the common function,
> removing the duplicated initialization code. Update
> qmp_v8_configure_dp_phy() to call qmp_combo_configure_dp_phy_common()
> directly instead of going through qmp_v456_configure_dp_phy().
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 99 ++++++++++++++++++-------------
>  1 file changed, 59 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 5446b8333a1e..fc35da80e57f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3489,6 +3489,7 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v8_configure_dp_phy,
> +

Please either put this newline in the prior patches or drop, otherwise
it's noise

Konrad
