Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A23BB10B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221813; cv=none; b=X/UyjeybDUs2S1OqCRbACH9QLBDWzUnOGsjGmd7FDekkpHUeWiGqM2P+jXV9Xk8p9+036MW5YDLTQSSfU6AvUOyRchmY5rKzY8ugqNVY4V6pNAXDHqTY2FC/1BKCLwCXr0BAGUXeA2DVQgFEbSL/rFY27UbTe4YuZQweNLtr/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221813; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jeHpOZ6J/6/fZmEnjMzz+zbxiHftX+f1MVXEA5Q6+H/6N5EuhctxNdBNs9nBjzHPwKplCcH3QhELa1UX9UXUbnO4Rgw/ctJa3nknK+NRYN3h17T6Dx4eLjhjfWSUluGe4vtIA8qwC0OKrax9fG63TduSezkKt6IrnBsFUDMObhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLeqisVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bw66Gpt1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLeqisVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bw66Gpt1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2iYA2932660
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=FLeqisVpohtjfiKG
	uu9WOnyP43DTNRKsACcNtz/V3DPDP2zV9kdbtj6I5uS5+twacR5RquLb2B65Frvj
	N3+apfFAcdYcw7XwtW19zK7cHRIegXOUknbUMLTgvr8DLLhQPED0tf4dTbSpo/mm
	JxnPYt5OD0wioibdZWrmK0Pav0dZcNyM37hsjDpFvgtJdqGAzeWH1PVzzL/SE7Pd
	4C/mqMbBzi1wFrOLFsfKCJE26Bi/NmbQ/bLTMEz3GXSUCCpGFeftHyAaTBUjhyeC
	DfRbUnz2xmVpJdVGBzkurbwWTxF0+DykZ3Pv6br6bNibLbW6x1sQ2CpXIp75HXBU
	3jDgGg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0g3tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9d953b71so759481cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221810; x=1787826610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=Bw66Gpt1nf2kGDQXa4NoxUXqjjOjt1W8/IqPAOVCOF5TYGqMKwgNBUcjRg/GxHjW/t
         SNyQ/4m9Tt9HhjEEv5bcqV04jKJv0AopsNqzQRKu/LOSkzWx6le//D4UYL2hVYqG96ZG
         olQ7fLbvqKehnNWDuJ1XR3KO0bjcsah8md5+VJmTmRbUGL7ezM+biT88xQoalqR8J4uE
         ubElvuRv/I5cO/BDGPbT3gTtqvMeLfAdgEYflGYa5GqxNkgiDmA+D26TRLHK6aAEP2A8
         onH2wqT1OYqFavMRL/XUCFwQjs1g9wjs1I62bMMVoBmtPOzAoNtb7c/2HELJ/m29GeKA
         buQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221810; x=1787826610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=TB0njVToF/mmPWMDbfdjMJlUMv54FCcDN6mKTsdHe+42+X12ywAJaxcnz3UjRZRF3A
         cq9DbdEVkjQz/lHYowtV0jzvASkIGEw0Jhwul9nscnIs1BIuoSESqEwIiLUAJa2aEGng
         m8St2zld/HF6fP0AJEuX8+N0owxktteCGR1/H2YjowjQmLoPMJtTpSzTYr2uIjqPbNTV
         8NBzJnlmnfUHmWTuugcYjLEPAGBV+idVm8lGrT/tuqaUn4jH0Gxev//7FM5RSN8MN5KF
         CaCJRpAk6x9mcAurpmo4AosM64wMzThjQAQ+8ngsE7Xa147C31PyKhO9L3kjXCGdoQOY
         WY9g==
X-Gm-Message-State: AOJu0YzmUxyyi+r8LVwo7RZSpDHakShXyGsqeGeBKzeHV6Cp8PUbcwi4
	Fh9SLurAk2Kz6xuDSy5HerRg+oW2scWK6JeaQwWr5ZeyITqYOJq5a5CWeHV1vSUZ4NSjeOk2Vt1
	iL4Wuv1sTlicDOppCE1g7JI4P+BhoixuTdkX12j5lzk0ZnQB44vB+JawMUMVjAl5RVvU+
X-Gm-Gg: AR+sD13tQAerCR8VcpaWk2Zj0NQ/4rvMtyRAduih0lS52ieXYD3nC2TQ0KvaJbeiwVI
	UjyIfD8ilwK705lBBhwjl8TbHZD0acz8C+VU461DxCcue/c7lTabxnbuDs8kfNcqC1RmXOBbB17
	KGjzdt/0P61qsly7SoiqbxjezPXEiyffySw3OoL2mH6cOAyTVA/3q/AXR1XERDIRRUAF6IK+bH2
	jOaxMtPPzyqfJ/SySlcIbPyfg5MPEUat/w6nd0MZtjW7HSH9dLYOQ2bO59eupOrlGAefr+MA7kF
	TgtmOsFNRag//VJhHMRRWi5dYfBbU+qEpvbtZtVoccgRMc8iqnBPZHpQ4rsxeH0AHmqsDlEujMu
	z8LNWA8BDBHGNy99yMU6qH/6X
X-Received: by 2002:a05:622a:309:b0:51a:8079:795e with SMTP id d75a77b69052e-52dd6076d44mr74645441cf.4.1787221810161;
        Thu, 20 Aug 2026 03:30:10 -0700 (PDT)
X-Received: by 2002:a05:622a:309:b0:51a:8079:795e with SMTP id d75a77b69052e-52dd6076d44mr74644991cf.4.1787221809756;
        Thu, 20 Aug 2026 03:30:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:09 -0700 (PDT)
Message-ID: <c0a53982-92eb-4b26-8980-b7ccad99aad5@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] clk: qcom: gcc-sm8750: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-6-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-6-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RRFih0BRn6wbnKvckutSvNRawKQxneLs
X-Proofpoint-ORIG-GUID: RRFih0BRn6wbnKvckutSvNRawKQxneLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX1OI2YKpDixUx
 /1HehrQL6Nx7wd7SU1aFUSXsYnzsr9kVRFAhW8mqg9JqiakbASuDm7rAkO+KC7OcFkEi6RYxQjH
 PvKzVnfkPEToGCg5YCcaDyj+JFwmIQ8ss2RusSvnv76LY06u3n5+ZpKnQlMUUrIpDtqggbvasMM
 pWGgZ5Xt5MRdmmq9v8Nm1SQSU1xUckurSX1xhQxWzxfyG3PIeAxeC/5qqNUtXfbjvWlJkqSxr/M
 TO5gzRXuHRTOu4q4nIIpDxC8HAqZxVGGHnlF2Oys8PIlqfaqCoGXEJV2KOgKR/DJO67Vib9+c/n
 2B043UA5rUNvlANA9kHgexHheBtDBWTjSeoy1D6wWHDn2gDku2tnwt3jcqtrnAa0gyhTDlHM90n
 nGbce+Mo72ZGGo7aE8TH6Ee5eiNMREFFqgn+UIdvjZ3m43qzhCwUn2/ZbvbpEb+T/SED83fmg1R
 3Hh9xuErmUGn2ZVQ7aA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfXyY5N8gxKwome
 2rIbJoFd3Yg/nfpDgYooUs6OYDnvaBa8V6daLtUJEq+FLRVMN1DUErj/aZIFR/oFDKL9oTixrVy
 ENzHPf8v8+8W/pl3+0DPHmVLuAJox4U=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86d732 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
