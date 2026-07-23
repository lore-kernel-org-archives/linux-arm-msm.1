Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B3D3D3317
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833667; cv=none; b=TuL+f99p/YRMdteV0JwaE3Et8pHsPH0Yu7nc5FLQ4yUywFeV85p+Zh+NAPX/wGVik3o422esYC6Y14sPgLUruHSLtZceF0UkShmT7jpLjDwCrXjpYRga0myx4IXuwtB1L9i/HgpmADkNr/f3Nfp2jFZ6beH+vUhy/CBJWrgPzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833667; c=relaxed/simple;
	bh=094UwvJU6Tc333A6BTBZeyDFvPxqAHfwYg7qVGbLxDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuMmkxMPZ9NqU9qwokz/W8YThAIB3CEHglv6V7l+fjImQfmvET5yUI9iMWlfabh1aGTvT4honVns3AZtDxe+qL/p+C+L1QvPyevOsglK0+Mn3SC6eIFZZNMofvz8YJhSvfIcXPZUh77aPV091o+K1e91mBxzxoDEygr3/FyxmZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3lXbx7M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WS18onv9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3lXbx7M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WS18onv9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIlvkP442916
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q/mRi1bjMPBejJxV31iqf7/g
	77qPxMAdhKBB7jv1Ixg=; b=H3lXbx7MGqlGyZSnCDtM5XzLp81dPJyR+Z463N1I
	mSf0NQMGRWqPyKDhJNAhyUMvu2bZigCzn88cMDe36F0C5Ocgn3yzJowuTAduCHl6
	dwkLQbGnFQ+wc7cjXlF6nSmnCqyaJ5pXN7hOOYgnvxuSZEORSR2EjagYU/fikg7k
	sb+N0aW+sqOuggLl1wDQzQmWYv2sGIG3vhowjlRfxFCohcQGtXFum6eFadUGV+IA
	C/UHSBSJAwm5/jvaa4cMcCpDb50FEX8pEHbOMtBQD3x+ohq+uOCzPxK7EhLWMx9u
	mmQGudCF0KETMG5hMbB0ndn1KYsij+nNl+e0U5+pBhQZVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqajrerq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:07:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso15412491cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784833661; x=1785438461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/mRi1bjMPBejJxV31iqf7/g77qPxMAdhKBB7jv1Ixg=;
        b=WS18onv9ATAb17F17uUSMVN01wv4TyPFmtBP7OSPqsw2tGyLGFm1WKmoXn5jPrZmxW
         2bEpc+L+C46vnM3hxWq6axta7BKnsE+0bmlGpxWElaw2/798pVBhF5rgz+Z7f7ITFeul
         3yHoHGs1Pf1Umob2xNvfwtJhZTmQ9iry2MxFMsO06igFfuINrX3Amo+JHVSJeuGLWWeG
         OiUVxNgff/ABK9f1+tu7TxYLJjZxkROpSBgjdRzo25CyIykwcq2fudED69MRR+rExncF
         NZQBNxaH5E1iC07/WISGOMcGG5ew98wJRmCdWWRk3nZGoo5WzrXNdj8lvxJOdyXJbBJx
         UhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833661; x=1785438461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/mRi1bjMPBejJxV31iqf7/g77qPxMAdhKBB7jv1Ixg=;
        b=shWVB9Cbiuhz09g8hg+imqD0YIhnF2NQBMvkJdooXXNLZKBqMF7Bk+nOPHWZq41cRF
         anogAEfoCi2rXHfJ0XZPYz8DArtjAYMTXaA/1WFnKY9S8Mo95FPNn5gPAAlHhB5uTZUf
         R35Cm0h3pg90rRLreCG0zEoPKrGiy7KawaRUIRPVddIjSXxbJuo45tRCEeFZQ/GpGF+0
         fM1gFehOUtTd5p7qZQNVl2GaG8N9QtdfVNdPjM/Vdal2FIpUsFUA5zio2iIohIEMBTwu
         HUrtuJ/mzYTufydCYWDuP8jEQ40DBs3T6eGzZoaestpnpZfePd111zKzYOSFLtDERHzO
         5dfw==
X-Forwarded-Encrypted: i=1; AHgh+RrS5HsK1zvkufcxmoaR8yhU72M2gcOV0u8Rn+AH59enLiNQP+2AXWa+2kcsLtYVj0SxXcB13luFTqzVuDvP@vger.kernel.org
X-Gm-Message-State: AOJu0YwALQjHG9a2dlI8IyL9xCabFp6SfJFnh1cpBM8TzNztWvjnRV7g
	LvPXHZtOwaIid3dsZar3GuUHL8dADVu3/GasK6JE8baF+dVTLi1za2pQ8QHbeAvFndPhmkFXFL2
	RfGFZcWqgSngJ70Eh8xA/XOzBljJjwxgdKQJrmLq/FILL6+CSdK39bscagurHkkNGZXfA
X-Gm-Gg: AR+sD12gMn0tgRxcIfek+PRotnEwEiX7bPPxFbYBVDO6kyNx1lLPDB08wzSO+9Gr28m
	XYV4gEm5QzSaUKrHKAvHZTOkPeK21/CqHMVBxgI6z2dwwYHpjbO3cSpqWe9spYa/aJOIYnLXiHT
	CRSF4ssrSC7StbWrAlPxZPC/mwUsfOowLvGqIClI+cy1qcA/gKjjwVjga535mTIr2rhJMVR3i3w
	dj3KuSmmT8HQS3KPWf/6b5iasBP5LF9suEcDEV8tEBMNJauN0mWoAb4obCrWwA0K53JD6MBzBQ6
	cEKYR3LwRiysPhrJLxaCWuoJeRB0GiVXKAGTGh8nbQnPvwtkPVBGevf27j6181l1FzrrkCNu5tD
	8JYrHRAh9LWZLBk5WD9Suh8GVxTidaO0egNI8sO0TDGu1DnM/5oCsT3l7sVLkuAFoGiCajX+Ihi
	li1h6/JW/U2HUSxg==
X-Received: by 2002:a05:622a:5917:b0:517:642c:8196 with SMTP id d75a77b69052e-5283dda80d2mr47438381cf.12.1784833661140;
        Thu, 23 Jul 2026 12:07:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5917:b0:517:642c:8196 with SMTP id d75a77b69052e-5283dda80d2mr47437901cf.12.1784833660571;
        Thu, 23 Jul 2026 12:07:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e45344sm1135899e87.64.2026.07.23.12.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:07:39 -0700 (PDT)
Date: Thu, 23 Jul 2026 22:07:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rahul Samana <rahul.samana@oss.qualcomm.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kodiak: mark PCIe root port as
 bridge
Message-ID: <e5xsbfnsauqkvd24ztew75gqh2l26vbwos2pgvzrhx2qgrq5v5@cshq4gfumvtg>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=6a62667e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=b3m_QctH4RwnUCLtgwcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX+zOX95WEyb+d
 Sm3H/hoFCPqaWhev+cFVh/9SWXZitMJdr7YBsJO5W3YdH26HGY/UJAUmvGlqKaoK/a5ytwUffu5
 8BrmqImdQXjVAQ+3BsFgGX2uqTo2V/+gtCY7nBi1Cq+ksEH4S0rp8KncK/9l5ZiV35BIL849/jX
 Vi26yF2wE5dm9+ScLhonPoHIAEaTqXAWBYnMAb8wr8x1pMhUUPXxcLsDizq2xGKweflFaUKLujX
 6bFjnacks0iMp7LcvVRHvbeXaWIC7gzVyXo6KY8BSir/ZVMnnaJ0H8odXCNm4yeJ36KJmafEzS7
 WY3AbMOoCVsFGLrigvzlOicxRT+C2v96GLAUbGZLbBu/h4lTyp2Cb0uD2f8r0Cabli/xg+bDZBh
 jrht0njk/8F+3F59F2KbAv0Y50PKTLhLd+pSa3MqK7v5tppNZcPzpGLym4vxkx0eC9OcB2baOS4
 t0nCfEpL08iPoWDRbaA==
X-Proofpoint-GUID: wuZMkfxC2zb4PUWXOQPsItCTYA_NuG2h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX17c69VdBdPbq
 doA4qCZTyIbvVX7eAWkYYNe+tFqo7SxXjo5h0FHAQfGPPrmLJ/RrlsSYdAeF57Va95yxtVCH3g4
 m3xZjwfs1scpEKOC1gbJTkDuSD63jYE=
X-Proofpoint-ORIG-GUID: wuZMkfxC2zb4PUWXOQPsItCTYA_NuG2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230186

On Thu, Jul 23, 2026 at 06:01:08PM +0530, Rahul Samana wrote:
> Add the PCI class compatible to pcie0_port so child nodes below the PCI
> bridge can be matched against the enumerated PCI topology.
> 
> This is needed by the M.2 E-key graph description used by the RB3 Gen 2
> Industrial mezzanine Bluetooth UART overlay.

First why, then the list of actions, not the other way around.

> 
> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
