Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655236;
	b=a3kMrxL4LfuY+D4D44O7j+lONXrjBHsXP95Ujbbv24WJ8IleYKsh7YRnw/j7+mDLVSv7
	 bgYpeYpUH5Mpf0I6jDCKFI7hWu/emXzmMgc3P8rFrwH9m8Eq1b/MRWDrTKQf1igtI3hp2
	 LgsA2FbEz5/Je7+8QS8dCfHz6+c+04IvXnQAKB89AmH+QW13gCwSUBu5/NBrk25Bol4Eh
	 sKLnp+3xPiKlG3mgpgipqjdPQAzOvOD0lgU7POPzg3/HWaze64rkR+ageldGZxQgg9sjH
	 qMpsVFPmxK+psPP96U2QN+IflZUubCWpH96aDN/BTlPQm2s+Mzyj2PbiyZkLRFRmI2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C7UAW1KFyOtoF4BRFTDjluqDlRf6MeW5wwF+NAAgNHA=;
	b=E+HWiVbmpVH9Z6bCFrdIK29/sJ/h4x4R0rKUJjqGzpYWkogv7QfQFVpBU8KayJFQryfv
	 yUSzoQMnfyZ/QjPSUYb50b0e5v7LNWT8w7Ag6khgF4l+T2HH5Kre3aYXRkhebWw+EwSwc
	 2OVVwSrLAD6phJOhzw9BFUepZKf/BDzO2r/cLwGhz8HCEJWc2IQiLJeNmly+0sMr05iNj
	 PmkYrFIS35iid0Q2bztfug77wIqt3YdMRuCKJl61O5WrctGDjhPZCesEXC0gRpMEoD8Ih
	 ZP+xrc/l/D8ZWhMcbirB89KIhNuI3MhezoV61X+9u3cc/3huetrNLtc7SydkSm8oTkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgKS0lJl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evfGega1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5D606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E5D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgKS0lJl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evfGega1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M707pP4136670
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C7UAW1KFyOtoF4BRFTDjluqDlRf6MeW5wwF+NAAgNHA=; b=SgKS0lJlKQqiBAZj
	GY7B+4+vQ1XIAXlPskPDYp/gKq9YuaFSHb0Nn0Z1mGwpgl1mdy/HpeNumCzh9COE
	zuXugRZ6TIgXdepyH2vPSW03+ZwswgVkiAOmpovD0L6sWSKIgnpERp/mdFK2xmUA
	K2uw3ax7JbXoBbzpIR0QMUp16Rc+yJ1P5mTUxYV6245MLAunvUVZilvUCyPdtUJU
	iEB4f0+J7uXegrf+SdA4zldhsNlt44sB1O/zCjXeqfT4IHE/4CkU7qnvQS35KvJA
	jEloCQyu/wgXAz9KwcbpJ3Ry0+CcEIebKRxI9H/3stvHVfrMBbLRUbEDZBF/x/L9
	awqGCQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9a31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:47:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91795e52969so4232666d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655234; x=1793260034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7UAW1KFyOtoF4BRFTDjluqDlRf6MeW5wwF+NAAgNHA=;
        b=evfGega1zJRsuP6b/r9lPkhKvRF0SHzibAGGqVuAEWjvpWU6lUz/BfvZ9B4KJFnfWy
         e2cawJR7vybHg/LazvJJhZXVnXpDvRa96jE8TsXYowOXHMrVe6apcbWSN2feDeF41ePF
         ofPYMeCLkmurnu0HvdAyePEJ8TdKpAyhPKm6K/2E8fD8ouxg6OpoluA0qFHI/gWlFBTQ
         SWuzBUf/tVs3bAXuEVzRPVi/0UFzvrJ29VfdP+j+RlDhe262uJ7pmhDwZuYJYLEIFKhQ
         pWIoeuWQW7dpfUdog8UmCCQstswwuNtPawzmlNrRIDQetGuUVsDrfIoc+ZF3Tpd6Kkd4
         Ph7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655234; x=1793260034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7UAW1KFyOtoF4BRFTDjluqDlRf6MeW5wwF+NAAgNHA=;
        b=LUe8P2UmmppWfVy+KJ3/7DJ0XIVolWe641UUA979QK0EqGr2wHM1kKbOF/4G3D+lUq
         6pfZUL9hEsbcFuqPJkd663C4+JS7kzHA2sfWE+bTquoE1iLdZ8IkmudADD7XhxS4zYgF
         dnoqMc9bX/sR15UV9THtx/UOlCHj8OhqcYUnvDoXUPeRWkQGd50nI/mvmvJgdc1CM5Z8
         VD9MMpRBjC7YuI2/xtSPUBXSy7iSvapFRyozWEI4T+rm/rTx/y5bQjuZguuKukSvktbD
         XPvkjAopJEc+3+rpmiFTJh7J6WewV+/c8LwbT6ewsKLDuqTtp4KKG5rS7MnR3PCCC0c8
         pN0w==
X-Forwarded-Encrypted: i=1; AKwUvByVRUwB6rxrcV0Ev9oxrRA3LrH6funSDfSYrr6G18uRwA1G33EIkH3cWiBghvt56ullCGDZlvDLvdOIH6B1@vger.kernel.org
X-Gm-Message-State: AFq9FYLGemZ14f4hJKAvFW8LLWi1H9aqb4+HiPwoavOv7Wwz5+uiLf2+
	l6wC5IsMYPJDXgt9+LPpfCDWI9jjlCApTEXE7a2HrExmOJmsEqUMurNoHzbcrPbujfzB8azB72N
	fYEEXeX7iXc4C0uymBmU3VqwaLNoBmPdzb86b0eHutqa/2sO+QjSAcDLx9GHoHuqOZlAm
X-Gm-Gg: AYBFou2hYzmMs/6e0d9a3fdCMu3PI/o23SzNTwNuUuNTROwISV7nvWFSLrivxiIlRCS
	MlF8xFFpkhjoRyTcGJwSgAphKCxrbF2oLJ9jZlkiDU2wrFth/63AwoS5c44oZAO4BtJTW6cWMqN
	Yf1mA4OFy+Pd1E1RRwRg3N0hF5RL38U3Cj4b/Ad1iXHkPhCMiM5gzoDdDw4wluy4jOR94LaXeqI
	mztB8bNHEvloXqxUy+VHgkQ9pRPYdruCxbAbzHtIEYgMDg1QPHVRQgb+bA363KnKJy1xnZlv1mz
	Lfo1dARQSx1d8uXgXYlwrmmSu9aGSjFRi7+fQaKTYb6p8ZzHm5Fz8ax/mR76ITrq+bBYju853L+
	V2wTFyUjt+ivis7x6Dwq1bg==
X-Received: by 2002:a05:622a:a884:b0:531:2663:2cd with SMTP id d75a77b69052e-536a75ce176mr61217471cf.1.1792655233868;
        Thu, 22 Oct 2026 00:47:13 -0700 (PDT)
X-Received: by 2002:a05:622a:a884:b0:531:2663:2cd with SMTP id d75a77b69052e-536a75ce176mr61217241cf.1.1792655233443;
        Thu, 22 Oct 2026 00:47:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50bc9csm81543566b.15.2026.10.22.00.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:47:12 -0700 (PDT)
Message-ID: <601fa952-3639-4154-96de-aa09cf5f692e@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:47:10 +0200
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
Subject: Re: [PATCH 3/5] firmware: qcom: Add an TEE bus based ICE back-end
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX2iurQRLLUrnJ
 e7WbGxLfVXOxFPbuGhv04C5G8LgWSxB08cBNdAzQ+NyQ3A2v7WNJyiPMmq88KB+orpn1LP9J1m5
 bJwrqJdp8r07XbhuCG2XNX/4yPtbL/8=
X-Proofpoint-ORIG-GUID: QA0Grl2PetlMOPsFi3NSEJfPZbHASaSJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfXxRHaLptjSZ8y
 ASgyzXBQFoxUVd3h7x5pkQZns8Li+zvYa6rqMu6kvCTOwKoaYnWZQkcNbFXNkEf63p1aE8iaLzx
 uvGw+mS6So14c5QyZylafu1qFHHnU0V8DW7SbgUzgMu0t27J/NQYD9Ghl0LKoB8HZXJRuZJNJ87
 lk/PzaQJOOEiDhA2wGeDqa8swIfsRM9AqTW/WPIIe+tgZeme5wSnlvz9BUZw1yWuxVx6o9j5zsP
 SA8c+6k43OVAox5VuOWMEVED+lUs5fWaZYB2SJdluO0DV18F6XBm5Wpl9AtdzdkGYp6dJDfrUwF
 rGV5+bRP9uQnm4FK8jaUceI/0EgrGP+Jmb57ZozGVbaPpZqd6ZTqa8lt2yPTZMFXmPVCmWLjLvd
 hkLoHduxULmFvE/oQSfrnWt90ZFQOfGZ87HjZRUezWopdRmjYFSPNIH1dSkMY6L+3P/RLm0L8Dl
 2F3Zd9zxqOKqy2wbHeA==
X-Proofpoint-GUID: QA0Grl2PetlMOPsFi3NSEJfPZbHASaSJ
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9bf82 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7ix8c-dH36osfZYG5LQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220030

On 10/21/26 5:43 PM, Harshal Dev wrote:
> Add support for a TEE client driver which forwards calls from the Inline
> Crypto Engine (ICE) service (invoked by the ICE driver) to the OPTEE ICE
> Psuedo-TA.

LLM says: typo: "Psuedo"; s/an TEE bus/a TEE bus

> The ICE PTA supports both ICE Legacy and Standard modes. In Standard mode
> Hardware Key Manager v1 is supported.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

[...]

> +config QCOM_ICE_TEE
> +       tristate
> +       select QCOM_ICE_SERVICE
> +       depends on TEE
> +       depends on !CPU_BIG_ENDIAN
> +       default m if ARCH_QCOM
> +       help
> +         Enable the generic Inline Crypto Engine (ICE) firmware service TEE
> +         implementation as a backend.

LLM says: please use tabs here

Konrad
