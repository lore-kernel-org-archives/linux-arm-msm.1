Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295983F86E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163148; cv=none; b=KvcB3/b6+lz7C3nujrc9BQEQ7cwNJKEQxbF/so0N35njCe+ZRQozWc8YxPNRggdsNcJd1sMUs9CkEBgJeVWoh4rGKbWUrgGZ5Wf+D1iXYR4PwuxcT2MFWzZ47aeno5AO82wskZpekr5wg4w4xNisIsoWsQfAP6evem9dAXbHW48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163148; c=relaxed/simple;
	bh=F8UZqBiRjwCdTWFQcl7GXd0FSpEqrKDObTlRUXLiWvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVPZr95AW1JEzkW4XwIiZhxWP2yFPC1mT/RGLFuOWXm2+oXm64jfyxfkvC7Buf7AJfEAkrSA4FSCOLagecicBxVTRoBznt5E49bVOXw2RzSCjHj7wVSLNNtmU9JSfBytwntiF5wCsgJG3bTOFTmYOVDAM5WPaGiuD+uU1AHLVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWwmAoRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtMw8gwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWwmAoRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtMw8gwJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlm5a4035389
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fz+eyPs+lXUU9m+3Ww1RsEM6
	yEKfds4RuaT0czVXZ08=; b=AWwmAoRUL4MB485xWnv6qkhVQmhSoQ7KayOKbVmg
	Pi0H25rzQw24MZs+vgfuv/y66mRbrYKnAvtD6b1nsBYYmZlLk0vIvLqOzxq+J4Er
	VkAj+kbCe++goNPcMJZKPbRUqHaHX69BaDYlOhs7WLZOij/ojVqwInjFhuKBGU3R
	dINX0cDFXKC9GMm++MPJwwKvLA2oPXQdJJuL4pbasnIUFPUWCJkNgnZz6dAOLkoe
	KjNfndYxqbZia2ULTPDGqnHG787YqJbgoJkJFGcrMOBrch+bNIUJ/B4oaa4HgQaD
	YqGECDVk8qDyxYr6NCknd7/m0InSO5yqje+GdHFkoi5c9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g1qbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:39:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso28136641cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163145; x=1785767945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fz+eyPs+lXUU9m+3Ww1RsEM6yEKfds4RuaT0czVXZ08=;
        b=QtMw8gwJDbGziABQYt2oHOLyvaiL0/Rn1c8UvOd6JiSQABHoIqjzHNAUkrdGV8r3aq
         lOpkadgxOxPAvHifX414QCA6ZNXiI73UBZcCo75d3TNIYZYnAbDilxPmoJhyu4VaAXpP
         P4FnzN2MjjCrVo9puXZKQ2JVZT3asC0FV7vwQCwzsnRrwrJtxbyzPwCXwA4M+J6nN38E
         UdCp/8uNxVnUIHlTVfttLVNfzo+FV2Z29G8z4GjsKJvphaQ4StjRzx15EBXZg/VmYUvP
         kaMgsXjZ3AhBYhg9JuQr9jk10JITSgsyim/KU7qtA4NMJr9Q2wTxLEZ+NSAphL403S2g
         BhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163145; x=1785767945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fz+eyPs+lXUU9m+3Ww1RsEM6yEKfds4RuaT0czVXZ08=;
        b=Xf9d5lJC0iKBPFuPDSXGI7MvTJTdxYWxkN/jFkueG8LlorUXUNbk+nljLzDsWLrHwu
         UFlsf56EfHvBhuOf9GoNd8NtgGDWWqOr8xRpzRaUVm2sIa8rhMM7GfRDLUKziIyo72SJ
         Z9yvWsGw9NuClI1GrpmU//K15wmDA5SXs37nMWOdAb9Qbees66RQkoubDY67dc8ZaJSU
         JyzPrLm/ir2sNgrMGdklqOu9NqO8nAWCxwCjksHXpizNASuMdyvODZ9SNot+HKrhcR8K
         7vWRFFBvobV1QOmT8ZqplZGlJ8JnZ+JZzB5h1es74sWsIC7GLl0Dma108eVw42wu6RmD
         4ZUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRft20tqnQEzwBrw0a/3TWMSUWNWgOmAXQdiBlfPGNmz7+lGj/DJddY61ShyDUrb/tmbL7JMWhuzbdd2c6@vger.kernel.org
X-Gm-Message-State: AOJu0YxisGelroh3rW7/zHPiA8WIzwvavqaUtdgy3XWGoWlf3glE+zi2
	goayTEVn+3LguGDu7qwo0kKwFGDDZ7kxUiOyWfUsSAkca3o0cI9eRUuIzRyTI8hcmsjuinN420B
	QHBPUHG7ztcmvdKVFSMaqc75KJAm/xxcjStnmX5VI8qxvoincTBYsDRl2KsHO38x5K1AU
X-Gm-Gg: AR+sD10av+F6C8kZIN0DjaJT7iDBN5uf/xVUiZsOMgaBqtTP4C7L54hQzAqpwdXQ5B4
	gbyGjnWd3PhTFfL0VT5QCS30BN2YaRMdmJ4Db34G66nSnBjRLzHFSC0NGvtqP5Ueyc2M1yOXi9J
	JmrWBqqZ+/3M43A1TDVf0+ZqzByN92vXqK751IgCzwlFvCbgdVRZCxZKRujtZffeajJ+US98egU
	aHZnj0peanv/5X9bjFPwXUkrt0agrmLs3Tn66XM/LBL14ic03somjl902a6JL1lBySFxw6VyzY3
	iCD9wv79XHXQF6XWYYpC+DIQYpKg5pGQMnER5Z41FKAtm38cTUswueKLFTEVU1vpPwTtFF4X4ao
	S2TaQS1DBq5gYOx/pv510D93pxOhovxukDtwwOZWUyLuqN1F4tsbv7eOxAmu0HwLwjSrzjgwV57
	LPx4StlccQjBofsQ==
X-Received: by 2002:a05:622a:428c:b0:51c:1117:c6a with SMTP id d75a77b69052e-529a838257cmr90507961cf.4.1785163144909;
        Mon, 27 Jul 2026 07:39:04 -0700 (PDT)
X-Received: by 2002:a05:622a:428c:b0:51c:1117:c6a with SMTP id d75a77b69052e-529a838257cmr90507521cf.4.1785163144477;
        Mon, 27 Jul 2026 07:39:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2224cadbsm14054201fa.28.2026.07.27.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:39:03 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:39:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
Message-ID: <frtf2ihyfxmphkqtrldydkmdh7dnetzbqvyyi6cmopuoyqwkxb@hco3epyrhjjr>
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
 <20260727-b4-monaco-evk-m2-v1-v1-2-5429cce68599@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-2-5429cce68599@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a676d89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Onw8or0El9vTDhKMn44A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX6cCRQgDvh4Me
 Yh36E138FKgdEsm+VrWNOsXetoqpXeqeoYKcjIFOSr1nDnvB8e5wEzu+YKHeX5GW6hsasNWDwjc
 0Mt9DQdhfyXfRgeknaZ+MlupHboGd4c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX2/Pwie4Wk5TD
 cRMPQv8NFd/oMqcAamhnqRPjGm0zUcRjur68cwp4+lt2X7u3tqz/J5c4T6DNfpKXYLYh6Zj/R0Z
 1i9l9mA+7zfLKCglh0XbJro2ZBbPiBvp4jHTQXgGAXObxGX4ocoZWIwPbfOSMMIpNueo2AvmYNi
 QpJu8ODG5Qfr6HmnVZH8/1++0JVLe8jdYg1ey+RsIgMWXO5ZdJ6QLCuwwFG4LxLB+iMgyjCk8Pw
 D8XvVZTRoNLUmNoXP7ITwv2yhTOThOUqAJzOgvuENPgOwNlOH1vKTIrpXcD/lifPTcgRTIT0VAi
 cJ4IHWC8rDOkyjnSSu/0NRitXIGaGmA4bkJz1lgksN213YziKF6BJLMGrxyiaOcUA90F3PMROuj
 xw+eg4YGz7hFmT/pIkQ9uvf2wN3m9CQnf51B28K3rfzhbkg9Nn0vlBeX5Ioz1j6X2DTXvxmC3DL
 duEfPcdyL0b7VU+oeWQ==
X-Proofpoint-GUID: e0BpVPrw33C2y5mkkedJdtH36ZMcI5Fg
X-Proofpoint-ORIG-GUID: e0BpVPrw33C2y5mkkedJdtH36ZMcI5Fg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270138

On Mon, Jul 27, 2026 at 07:46:32PM +0530, Wei Deng wrote:
> The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART2 nodes through graph port/endpoint.
> 
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart2 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART2 interface.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 73 +++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
