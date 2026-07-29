Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028B631328E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785298079; cv=none; b=tYMp2ODOESDaZTAsjBk+P4C2Gm3Wjpf9R+Gv+eBgnZZF0c4fVFr2fKotfd8HG1Fzr9CGVSM2GZ2zF8dqqX+UYPWMV6pj6C9FcCqcv1RxbTYBVIpRolRE3QIasGf8NtUZHOWkR46oqxjWnrOhpfz+DhU9Z09KQgy9iTLC9nGmgj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785298079; c=relaxed/simple;
	bh=CJDFYscSgJO1rJLffEeW1pefyZ+BZTcU4/nQQVc8ttg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0nlXyn7n1P8GYHPZ7Fx4fhS0+6Sxf86FMvikXAuxblHwSY0b/Ra7GsCMIY2Jud9BephrKlu379r/+7z1jXm8droukip4hk8XEaJfWcZkFFAcvHwo92HPS2WhNGQttRegfY14O6ibJmo71ccvYFYC6zr/ZI8lYzhxAAmvgMVBYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrDq2vNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U65ceHGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrDq2vNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U65ceHGC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HWMM309477
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGjCIVQno7cuhBScC143ida5jzS7EfDwNlNjCfxKits=; b=XrDq2vNpSqcxRZex
	Pe0iaq92eSnKeR9oX/t2X+O4ga/7CteF231spCbysQGzoaivJWlu8QR2AF6cfjt5
	XM0b5+TJWIUX3rPSM9H18mchNkmZuQcy/OQO39VtlqP5Xi5kepffcRwYXhGZ4Exw
	eaH//ze2wYlJs6puZidVWufZh58zRyde+sYCGlBen4sAdXectdi2O853u1pkPGcd
	nbhUadnp+m6xB57g6r/QSD7vJPtg19gy3FTbuzHPIrEfBJNy1WBfhvxQLDajBUlA
	D6ylHkEVyLquoBjhqun2OyBbLrLCVo30PqG74X7fOHxwmvfOWpCZvDojm3zq0NXJ
	gq1USA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpuygby5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:07:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso15135065ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 21:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785298076; x=1785902876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGjCIVQno7cuhBScC143ida5jzS7EfDwNlNjCfxKits=;
        b=U65ceHGCm0jrru8kOhHclUsRhADIDoX7wqtbEcWYmh9Nhz0A2rRDJcGaCJAjHkKFiT
         NHryltnY36lAICdST4y/nj+Q/YSgwcfvJ2iWbDrVZpfJeXFIuYbpwW5uDbaD6oitXHiD
         4GI/ImaiEDNCB1YSHJjuZ3k+6KdkX+Wvj1yW+It546ISzjzhTPSfCIZ1nkg9w/ZJrVKV
         lHVGD0cQBbJPIwwfzger/1UuJff2B1zicx6ncw6OEb8w9/f7zDlMw5TSz9KjltCdN4JA
         qDaFF6CcPq4FKEnqytp97BHJIZTuQpJU7EnTwflWbsLEebhsaS2CvGEWsiuLQhiWr863
         fHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785298076; x=1785902876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGjCIVQno7cuhBScC143ida5jzS7EfDwNlNjCfxKits=;
        b=LHNgFodt8ScpuMuMY+FtlRDLLNfg0VKRyBonvH4lmufUYziEQY7E/UGaQnp43u3d7I
         f+vUKP0AmowPYJRX93OxFagGnzMFT1SZfKm3iXuR3XuVbeyLdqb6craiIhuc8POKNx6w
         0yCc9iqs+JAQkST8rEYddMzqN4jieaakKqtiN4qMdBNjI4/sB7nRjUFzTskdWf+GR/am
         jVnH9NokmI9YPwRz108LTQIt64z0QJYXJ8dxAAkuGXkc2UM93JsZsCuBkJO9MzTzmYlW
         M/0VuJqPjO6wzywdEKiOvYzLJJk9ZHXDDeUPntejpaq8MwvTSdydhpAHPZxfqOvyakLF
         1L/w==
X-Forwarded-Encrypted: i=1; AHgh+Rrd9xqY54ezP8vh43nEmOkKRB6sb7+QDnMLttfuc4h1hn4+LaEEX4U6YNWJV1Ux71zUgihDiDAikaAa40p2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1TtRG1V+W4bUU4w/HflooHPMLcNBnvQsDZwZSqjQN+qMUAEs+
	ESO9xYHjABfo7V8BlGvDHL2Y+wpCV0ThaF3rwlwQxfyz9jVHCpDg6/+fy3vtEGIdSVfPV5CCQjU
	HR74eIZYN/WVfSQwoohlm35/iD/jEVXHX3PfQZ7np5OBgqxJ/OPusyAj2/GZFP5MSV9Dk
X-Gm-Gg: AR+sD13DSV9yDlHxfLVtX4j88nREwDYPDgYEMYMj4y9gJcekeFRHTWnAuJ51jxGNgd1
	rC2c64mu8SFneUhkZQGVxhXdBDQEiu8Nse6vdun5rIgHJmgmyXufcmCEXKnp200EPeIkQsKW5BK
	M/egB/wZi7RSj2WnDcvMfBrQJRfbjdc7HzL4+pGiSwOmr/m+rzLhQZPJZrUDBIr99cWriL0ujYf
	no04ka1h+KJ70as+/Ul9BVl5PTYCzQnHFDp4dJVRSxINgNfxgptb4l6/CFoFH9/yPgkA16EHFhk
	cc0Wr/XmvTrzlhT0eJp/TPPUNYHD+JHaQ7+kpzhFB4OnzjmNFegBQB0dgvjcfKstx/RZteD55ZN
	w/tLsTgw5n8N+otfjcCHFiMsEJiBCeiqnL0A=
X-Received: by 2002:a17:903:1844:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d015c9cd4cmr69196645ad.10.1785298075762;
        Tue, 28 Jul 2026 21:07:55 -0700 (PDT)
X-Received: by 2002:a17:903:1844:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d015c9cd4cmr69196445ad.10.1785298075384;
        Tue, 28 Jul 2026 21:07:55 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.230.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504db2c4csm4492170eec.28.2026.07.28.21.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 21:07:54 -0700 (PDT)
Message-ID: <3eee6637-0b6e-431c-b3cc-959bba5b2646@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 09:37:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] PCI: qcom: Add link retention support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
 <20260709-link_retain-v3-3-81a9d187bb61@oss.qualcomm.com>
 <63rwvquftwg77cy6wmsw7stubpluvmp6dplg3nt5lzhdilio2e@dmdesbk63frc>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <63rwvquftwg77cy6wmsw7stubpluvmp6dplg3nt5lzhdilio2e@dmdesbk63frc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zpgC6TIMwoBDUDfA-TEL5VOTpl1D14e8
X-Proofpoint-ORIG-GUID: zpgC6TIMwoBDUDfA-TEL5VOTpl1D14e8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAzMCBTYWx0ZWRfXwFalgfMSNdiJ
 adHDntCwBCZ3ijaa0+e+8mcrIsCjayxgFXLuZv5Xnt2LI44GmDMkP/lLppkhexyknYCQfiF+/Eo
 lwMJoQhSMKxGC6zGqh5lKefUqhVtMxsHGdNEc6Sj8kUuHWMCvYJEYk3sA2w4HEMjo0m1UjGXyS8
 7UyOvZIvwZgQIFYn4b3XnoYH0CsU6Uhl/1ivhn9SXVbdb/jewqK4gldD0bRGbpFb0vyg6exaxNj
 fFYx6G6Mbcj+RX0TYlcUEgAL44tUKVA2fyZOFiokOlGxg699luIpgFfEqwhZRskcZ/TY3TwL232
 PXArVC8H6Jla+dFMV4DsJfzXibO5Zy00HwTWt3+QFI5c3ZoxG1FtOls9RdBuknF18TjZGw7IXfe
 geqoiNv4pi+enIeKIFRWEb+XgdsoW95gOybMSsCZI6ePZ2UafYOoD8EzWo7cPyvILWHdXR3BABl
 lXIcDNnK+YsCoGCWutQ==
X-Authority-Analysis: v=2.4 cv=aoWCzyZV c=1 sm=1 tr=0 ts=6a697c9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/XdJXUgKm5apizxDBrSIVA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=G0H1kKVpKd3q3zwLEq4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAzMCBTYWx0ZWRfX1TP5kT9sk/nw
 6hg15AfGyz6Gha03qihIFXGaRO5VCUDC71WyqG59ktmHE0AD/1ghX31ew1FftIaVRaxbtdDHmyl
 T3KiJ6Nl0kxzg83OU6Bh1s3dCchS0/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290030



On 7/13/2026 10:20 AM, Manivannan Sadhasivam wrote:
> On Thu, Jul 09, 2026 at 12:05:18PM +0530, Krishna Chaitanya Chundru wrote:
>> Some platforms keep the PCIe link active across bootloader and kernel
>> handoff. Reinitializing the controller and toggling PERST# in such cases is
>> unnecessary when the driver does not need to retrain the link.
>>
>> Introduce link_retain in both qcom_pcie_cfg and qcom_pcie to indicate when
>> link retention is supported. During initialization, check the LTSSM state;
>> if the link is already in L0 or L1 idle and LTSSM is enabled, set
>> link_retain and skip controller reset, PERST# toggling, and other post-
>> init steps.
>>
>> The max-link-speed and num-lanes properties in Device Tree cap the link's
>> maximum capability. Retrain the link if the controller's max link speed or
>> width exceeds the Device Tree cap, unless the currently negotiated speed
>> or width is already within that cap, in which case the existing link can
>> still be retained.
>>
>> Configure the DBI and ATU base addresses in the retention path, since the
>> bootloader may use different base addresses than those provided by the
>> device tree.
>>
> Where is this base address change?
It is being covered as part of  dw_pcie_setup_rc(), this part can be removed
as this being called unconditionally in this patch.
>> Set l1ss_support in the retention path as well, since it is otherwise only
>> set later in the normal init flow which is skipped when the link is
>> retained.
>>
>> Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>>  drivers/pci/controller/dwc/pcie-qcom.c       | 68 ++++++++++++++++++++++++++--
>>  2 files changed, 66 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> index de4b245b1758..0c98b914eb52 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>> @@ -471,6 +471,7 @@ struct dw_pcie_rp {
>>  	bool			native_ecam;
>>  	bool                    skip_l23_ready;
>>  	bool			skip_pwrctrl_off;
>> +	bool			link_retain;
>>  };
>>  
>>  struct dw_pcie_ep_ops {
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 9ca620d4746a..77d2d989e9da 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -260,12 +260,14 @@ struct qcom_pcie_ops {
>>    * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
>>    * snooping
>>    * @firmware_managed: Set if the Root Complex is firmware managed
>> +  * @link_retain: Set if controller supports retaining link from bootloader
>>    */
>>  struct qcom_pcie_cfg {
>>  	const struct qcom_pcie_ops *ops;
>>  	bool override_no_snoop;
>>  	bool firmware_managed;
>>  	bool no_l0s;
>> +	bool link_retain;
>>  };
>>  
>>  struct qcom_pcie_perst {
>> @@ -996,6 +998,50 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>>  	return 0;
>>  }
>>  
>> +/*
>> + * Determine whether the link established by the bootloader can be reused.
>> + *
>> + * The max-link-speed and num-lanes specified in Device Tree are meant to cap
>> + * the link's maximum capability. Retrain the link if the controller's max
>> + * link speed/width exceeds the Device Tree cap, unless the currently
>> + * negotiated speed/width is already within that cap, in which case the
>> + * existing link can be retained as-is.
>> + */
>> +static bool qcom_pcie_check_link_retain(struct qcom_pcie *pcie)
>> +{
>> +	u32 cap, speed, cur_speed, val, ltssm, width, cur_width;
>> +	struct dw_pcie *pci = pcie->pci;
>> +	u8 offset;
>> +
>> +	val = readl(pcie->parf + PARF_LTSSM);
>> +	ltssm = val & 0x1f;
>> +	if ((val & LTSSM_EN) &&
>> +	    (ltssm == DW_PCIE_LTSSM_L0 || ltssm == DW_PCIE_LTSSM_L1_IDLE)) {
>> +		qcom_pcie_configure_dbi_atu_base(pcie);
>> +
>> +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +		cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
>> +		speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, cap);
>> +		width = dw_pcie_link_get_max_link_width(pci);
>> +
>> +		val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
>> +		cur_speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, val);
>> +		cur_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, val);
>> +
>> +		if (pci->max_link_speed > 0 && speed > pci->max_link_speed &&
>> +		    cur_speed > pci->max_link_speed)
>> +			return false;
>> +
>> +		if (pci->num_lanes > 0 && width > pci->num_lanes &&
>> +		    cur_width > pci->num_lanes)
>> +			return false;
>> +
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>  static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>>  {
>>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>> @@ -1014,6 +1060,15 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>>  	if (ret < 0)
>>  		goto err_disable_regulators;
>>  
>> +	if (pcie->cfg->link_retain) {
>> +		pci->pp.link_retain = qcom_pcie_check_link_retain(pcie);
>> +		pci->l1ss_support = true;
>> +		if (pci->pp.link_retain) {
>> +			dev_info(dev, "Retaining PCIe link\n");
>> +			return 0;
>> +		}
>> +	}
>> +
>>  	ret = reset_control_assert(res->rst);
>>  	if (ret) {
>>  		dev_err(dev, "reset assert failed (%d)\n", ret);
>> @@ -1074,6 +1129,9 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>>  {
>>  	const struct qcom_pcie_cfg *pcie_cfg = pcie->cfg;
>>  
>> +	if (pcie->pci->pp.link_retain)
>> +		return 0;
>> +
>>  	if (pcie_cfg->override_no_snoop)
>>  		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
>>  				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
>> @@ -1364,12 +1422,13 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>>  	int ret;
>>  
>> -	qcom_pcie_perst_assert(pcie);
>> -
> This is problematic. Most of the init callbacks do operations like reset the
> PHY, enable clocks... If those operations affect the link state and the device
> is not reset using PERST#, it will cause the device to crash.
PERST# is only for endpoint, not for internal controller so it will not cause
any crash.
More over the perst default state can be set be assert through pincntrl if you
still
suspect this can cause some issue on the pcie controller side.

- Krishna Chaitanya.
> - Mani
>

