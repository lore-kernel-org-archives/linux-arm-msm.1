Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4142B45A285
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247601; cv=none; b=Au+hW86T8W/TFnKoc+WAR9qWAUFpiccgky/3h9p0XQNU3XoijMMF0AJ7qBjj0WIj410q4A8rnOGqT4/RZqf9c6lRN0TZnaLmedKT/uVXhyJpPWGmT8PT8uy1Oohsa/kK7ZcmwmmrfM+eBVUxtXcQ6oTFzW24W/2wzM9tWaTeqo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247601; c=relaxed/simple;
	bh=SuVWw66eKy5JnK3r53g2nB2OWaRv+p1v8YhHc9SSMIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7rDn/nwxeh4QdLhY/U7LYT3dOrDkpDnlKti6hE4rmm843xWakJryyYpSLh++1oScBHYThj0r+0MyABPNNMrsCb6C9prbpTQknqZkTCEeg9ohkW8LiG6XsUD7gNcVCc3Bel9dy6FiuBDc3PqF6KXxiGcePlRY5FXT+DzNZlxlvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPB4gOYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHzDD3Ri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPB4gOYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHzDD3Ri"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Qqr1811491
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iVxONI1aflUyK8XwlfsoiG9
	Mfh6q0kvO2xXoUu3pTM=; b=CPB4gOYI1lwHtz579z7doLqxhkUrpAz3RvKLs5IJ
	/3yJVB0c/nZ2tygQWM22s5BqvDpmgNRz0enaxLT/Jojkv+sL3chlUeuvc6l1GzB6
	Sn38s/5eQROXDkjKpkuPMbWD7LnYPjJFh7G/jJcEWkwL7mFg2xKC2g1sahN7zXAZ
	Pjh2mw8Vcfj+9Tc7Oj2e/v4EMaZ7IIYbi26eEdfnuUfSIcDGQFG0dD6u8EmVWi4h
	bXmBwm8wavOcX/DYaKC0ZhK8iyiDzmf3MYUsrUdiE9/H1chvh20j5PYTGFCa30jS
	gRO7umkXdNkN+2Cuagi1OSmcikSIrMEMZegYXYXyxIMI8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4duj2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:26:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so794927485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247598; x=1788852398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iVxONI1aflUyK8XwlfsoiG9Mfh6q0kvO2xXoUu3pTM=;
        b=EHzDD3RibaDXBP8dSiILow9zaTR12cWXLG48PyT9BtfuwjC3ylQYLD+BxPLqL1tlC9
         Sm3ljO0eKliDiX9arBZDC9/1mKld3tRBqK/vfxXc85HzUXZcyPG5OA5T2ZJzGyqa6t2M
         xkxTZyoRFkyrz7pmVXlXWP98YGdhivIvaNdrIq6uwhMpXzAPSp8noYaOJcAuPQ7wuysd
         w8Dw7IklB+etZOsflm93AjPHI1Q9MMTVc9xdWeiAyQWOKP/rWvd0/Pgq7k+9sJq360dd
         Uh1Ad30rhh89fX7GPs1Aw0rRyucC3CoQ0sfrDvOKBhFvcbFkr4xVLqlswfg1ramh5AGo
         9lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247598; x=1788852398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iVxONI1aflUyK8XwlfsoiG9Mfh6q0kvO2xXoUu3pTM=;
        b=aLTck/vCmy2NhwgIpSZefKSBUiyG26FAyYcUhb74bfxVAb6CA3fSF3igbZz/aIuG+I
         MO/gRr2snVmDqy8iWCmI0X26fs94A29cpOL3KZmv/4gTDxrBqYLiDucuJ5plB/nlpRqo
         7qp6M3tDGCpumKO7wI0uVmtGDT0nRzdKWVU/s4eNQFKPxRzC+C5ohIIT3n4mYtq6bR6k
         SMZHuC7XDHwqNrhjyUSGTmdBUoWV1iiuy+mM0ep5F2Q9/ZDuggL+VCbJ96FMW4Z6Ag/Y
         XF1aw09FUnLyZ7XWXXgMBrH67Wa7TCHAplmUdHJQye4qkOzhHztw6xkMTgiBYFEdP6tp
         jhFA==
X-Forwarded-Encrypted: i=1; AHgh+RoI6FOn2lxRUIwzTgrcySqKa2UaLqSzcHtgkSNN3vNJSn9VWAPuK7KfWuCQ7bfSX2+a1XZHnHu38i+gK4+Y@vger.kernel.org
X-Gm-Message-State: AFuF++n1XDPKrVj+c03aY6vHifHYiCVktq9Pc4GisLHb3w/3OtDFIJm7
	Ed/lEMtstLwcor3ASht/o9wbAz3kYSbH5SrK761148fDEE/+vOQTBSfOZ+J+AwlWN4QbhLy/hGP
	0whUd8vDSrtF/s7I0zC1aidZy4eMQy/XBQH1ViUKAWZTX3K1IWJBDZUejb89X/1ZUigbt
X-Gm-Gg: AR+sD13F4JFP+Kp0a4PyFL/vXvTo1ft55z0+tB2yIUNM6QJFG9f/nfU+FjHJl2HKQ+E
	otkucTNCqnPIpYG9YhcbVHPUaDoimGIOByCnEmNrhquoBegbBo3Z84JNIxAuC5879feCrDXuPiH
	GPOQUtlDAjK0P00CzJ80RFmCn62IYDZcGhh7kp3fjS4u8fHanKq+5+MmPs9tXlf/eud1JZjQCwW
	K6oR2gbhnORG/tTb7rXfVjBQ3CZ7kBNzYnh2l7I/klRaRMRUF4wZUf0jM5dj216gHs2iiIjDAU7
	s1lsOIcuP6LFci2tNfAsbe1DUffYtjHQV1p4QUqVSadmVWuKLzyeuK04GEk3UJ7jlpt85Fw2SJD
	qna0nJxgDD7a7nQ==
X-Received: by 2002:a05:620a:4154:b0:936:ea3d:9313 with SMTP id af79cd13be357-939480b0083mr713534585a.20.1788247598258;
        Tue, 01 Sep 2026 00:26:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4154:b0:936:ea3d:9313 with SMTP id af79cd13be357-939480b0083mr713529185a.20.1788247597727;
        Tue, 01 Sep 2026 00:26:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm282036475e9.1.2026.09.01.00.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:26:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:26:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean
 up PCI function nodes
Message-ID: <dg7754iwcpcwclvuvgley3o57erzamhkfbulnoy57drgb5gjog@iqnak27plvid>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-4-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a967e2f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=w6-NgDdMmUSj8GgG8GEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXzLzT+aUWqgMS
 50L+f8g4viIFcK9TstxrwlGPboDokb3idc5FbEnL9rJD3QAaFJj+7GGrjgF+z02FdWyA3KGPm25
 ewkp79xh5krWmRfLN6946qz+/VpatbjyEIS9deI+kOlcRkoAmqU5mP0ZpU0BO5Y4fUUHaHrqFy1
 +wrQtZ0FuOu674rS0XvvrBrQSwIl4m8C3WnT63mM+oDQ5SiKW3b7S7Zs7WTZTiGCp0/V6kW6Ibg
 V6pOIJsnUlUAc1wq2S5KhByO9VK7fO12fvIv0lVv6nBc4ZGaYFqjMm+TwzaqEpkBCBbRrLy9PJj
 Vs2GCvnD5eIRPhZeGPsR7WohxGjZBnYgnB6JV7xL32IENIyyZSyAwHDOq0sZe4YsYUPkgfwEKqZ
 CBEDWPDBgCgiwC1CT09wQho04GWkwmKHSsMveZxLfCvecK93ySBWPs/yzmPVP7lkeyDOE990HY6
 Dl+nN2tph5wMPasmaBA==
X-Proofpoint-GUID: ENtHZpKSemerpywOb8VW_AqW7ngjhHbN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX3oMyzrInYLy9
 V+zXRKqvUWFWM2klCe2Jd/ErFF98f3zL/vMcOfHWdlWJiIumHHb24mO4bkzTqZwU/6MELQa0TZJ
 q+qi8qvALLixiGVe4gU0tYegfTVetj8=
X-Proofpoint-ORIG-GUID: ENtHZpKSemerpywOb8VW_AqW7ngjhHbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066

On 26-08-31 20:36:50, Alex Elder wrote:
> The lemans-evk-ifp-mezzanine overlay defines a node representing a
> TC956x chip which contains a PCIe switch and an embedded endpoint
> that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> these properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: b64abb26a2916 ("arm64: dts: qcom: lemans-evk: Add IFP Mezzanine")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
