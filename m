Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601382;
	b=UfcJGykhmvxjTkeOA3VJ2OaOfNj1LGsjriNF1DUOzOCEF6py1cjCbXXXYJaUomtdm5XS
	 DOdhCqUmKzYJ9qWDx130Fd0CRa/m3ttvYILvW080TdZhV0m3KI67pEYUCe+TCWFE3Nq1+
	 WMYbt/+X3wKBGw8WX50rca8WSVRKdfiIf2hyo4MoZw05vEBTXbcE/bb91N6q9d4Er8Kmz
	 X0LU77ZO21hNKSgRBGUOf4EDDuR2JeYsdwnVu2b2FyaetBZPrGKw4MrWWZOVjbVN3iYms
	 hXhOOtIVWBbrlIKtcZtPIfT1NwkNUhq4082gvLTxpEUq0ztOd46VwpxEbrHN+r8eFxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=;
	b=ut09NgKeOZ+jHjR48bnqSHGNPFOjKBxCvxvWoXxUl9ayAmBpTmXOQXb4hxoQPikwWo9q
	 ewQakm4h+XstSt39yZ7flmyMtbTRIDMoST6sqwzdyPM17aSLXpLTHH78cGMp6z7PJAZML
	 Igy9Jymj+YAU4HaSretx/riSIKDcTnc97dHWPEgfQfVP/IUU+fzy4Dxt0yKDxUdEAN9rr
	 h1BFP1ZBqqAsEbgf6ych/pUVhSvxFwUKYDU2ajRxklifll4mtrmI20EuSRAUEIPk5cWE2
	 b19QcziA+evfOWAoEXszy9u2JCL0yaQYnLAvcS6Bf5oGOSgWrCoSlVl+C6FGnhElDVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3ft3L20;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaoojMnf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFFF606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BFFF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3ft3L20;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaoojMnf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nlal1505274
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=; b=e3ft3L20BbfVP0Cr
	orjedQSocV5vKsKHSqVfpOqvNtpWxarKhIaPvId+I54N9aiKAW1R6CIjdi7KINrH
	63lIeoXf+mfuTdiGW8V3jKet0lU44u437LnD8EoK41SOH9JEoadALRTsAX1/+4gk
	SNJgzFrMhdJk9o4ex2YxKbmmaG4TfpNnCyIjxQk2gomItUeHPdTEttPKajscvkE7
	8pY5sdOq/B8HDiR2ND21tBfbenAI1b2CLG7Jw122plXdctZNEs4Tt3cHJ2dccY8Z
	KeyYlBbW2NQBV3t5AlOvFbSnlRfyYhEYLpHP0ojQpEKZw5+t6+I7aNVY/KEJ4esC
	aGshdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29p8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:09:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55c4997063aso16442361cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601379; x=1796206179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=;
        b=GaoojMnfP4U1FUJkBOhfLE4DtFMcOK/JO7fbT96MQdmMQREHmEqgHuYAs6rqF5Zblk
         H4fzrWkRiZtOU6OLDKOaw9hvZXkfCCXN1RkxQqofY/zyyrcv3XX4QGS8hHGYehmYdaHx
         8hNoJ10thUfszgtWKg2xu2qYYp8Iy5f6aAsITnxcEn5g13iR0speE0iAXdssz7J8y6TD
         xAh6vRsou973THUDbmFizrwQptIytozEH9/uruU5zpI9FRo4FYds2VuLSL5oVokRs5z8
         rHK/cr2wHqmJ+E3QFN9iynDl072GDLJ7aDpdXBbrilYdEl5w6Tn1TIFqRxd7M0Lum/Ky
         5UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601379; x=1796206179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=;
        b=LLdAO/ogV4x7sk1CLraTOPVdJ06l1uXqhhInd1YHx1wcc+os1sJSZWNrHj+YiMhmOv
         QLxoABkkj6NxbeseUHuv18oe8KqEP88XwE82oGjdXVVzVcYldGv26nRcA1mnWe992QDR
         oFygCGlyiZpfvLfZv3rXPKleuF4KUOmKVB9S8ZDPYRzY8dOfbx5YIu5EfhqivK5YcY/2
         Y6Sf6zDyXTq0JHaz8cSmO1Jck70Y98R6zql8J7sVjx1UrryluvtNr6n2fn3ZkiCji+Es
         dP3WLzDHn8aT1XnLVx7OqAYBNnpregrmzwncg9AhOXd9ERSZ5DPnjaetCi5FkOFfQpHP
         +Mqg==
X-Gm-Message-State: APuU4Z/lYNRjOOQQPmI1KCV4Uj9jDh447oC1faKARtMcmk3qwkvoEvFP
	yV1wi/ryWdlvPYuHaKNqd6bD29+X8+7d2XfiQImD91CjG9d4c7nXj8yFGu3J1H9kV4Jrl6bBguN
	6B/1K///DKBoquCQ0dV/oxZ3ylet/gG653RAr4JyDgdHLP67m3g5EalSxUBCW272PJ8Iu
X-Gm-Gg: AZFdTZc8k7fxiU1S74YehEqAPfIH6WoeX9JpRFUTxx5xl5SWJollMId1TS5dep7xvq4
	0GB6VG8Y+DtCMt/413o18qEJPkqrBvchDZHugWMVCELrZE9uktWWE2cBHPSTApl397aHfCVoWt/
	i5LIzc7FLwZXzrOoFZUcpSJbBuQgPOx+M3cfjmlFPABXM3/56PDjbckof1McZMEBKt4LKyvi4Zi
	+//yQi5YlVBcHEvFMNpogkAr6Xon+6VkqyNEgof6hP9f8rgjllbKuquSpWia2RV65vKR1RB1dnJ
	t/FN9GeDAgMnHWQkaCwQ1gm1/S9ljQ8BGP1WFeWjR+/ZaPbnNedOf9iBKauXQSJySqcqvfqw1jG
	3booIiVgvkzrUaQvfDJ1NSQ2KpZxP6yxSzGYLYHcNFibUC4pS2/WfMn3YKmFk6uO+5pwfd2k=
X-Received: by 2002:a05:622a:e411:10b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55d769e8959mr290006371cf.3.1795601379438;
        Wed, 25 Nov 2026 02:09:39 -0800 (PST)
X-Received: by 2002:a05:622a:e411:10b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55d769e8959mr290005981cf.3.1795601378974;
        Wed, 25 Nov 2026 02:09:38 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm608990966b.61.2026.11.25.02.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:09:38 -0800 (PST)
Message-ID: <def07365-b34a-45d6-b439-078cceebaaef@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:36 +0100
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fO7-SvrBa5OxdAp-9c4nDuUgesaoC96R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX+MLlKwdkubIj
 I2mXxCXFP4WZCJCgGjRCcK2MEdTopYIKu3m3cOgPEsi1/FgO6JjZC8OxoRHvv6YxufpoHet/1P+
 V91LhK2/xaHb8J41BhbZ69lmqf0p8uQ=
X-Proofpoint-GUID: fO7-SvrBa5OxdAp-9c4nDuUgesaoC96R
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06b3e4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RthPVecxuDhBgGMHIBIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXz5L5siweAfwt
 lgljPkgxDsqW1tlm57AT0tXI93BHAjWAQ0mzHO0Ngzs2c9fTZyvHS0ufn7QGhFQX0iqv8YSg5me
 y6pbwdvbta46AqeeiDy7OSzkZfx3DF+R+GTgRW0GhmOeKwXCzFl0O4lx3eUeeDqQ2TKXbuK9MoY
 pK4FEsKeJxe4Es6NViWlpNjGPyknzav3VSEuuAz/znR1L+bwVUEC73nS9Bhz3AHVBrpK7NqFc+3
 ASPpgEKcfFPricFtrSa2ypA+NWDcRnvDdST9+kUb8F3hJrKIQ17xpCbfodNaCyq5Cefb0zcGMQW
 awJQPYtA7aOZffoLvpIIaQB9qRdvHVQx4ZUMwUOtoBgUAVt6YAJND9Oa5e+qlEhIjj5yTgMxwKf
 H9QjWRPsBWYYDnInnTYdc7f4oPUm5pOA7hU72LhVtHou0Cy+lgrBPbwhaeX1vxf35yBTVaMkhKM
 t5wxfar6ZDulUJzcmAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
