Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B6A34214A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139490; cv=none; b=a7M1JZYDf30vNxLLViSnWstPNqN0sPSqV5hDYTBTznM4vqXME09GeD4lCLPdGOGCk3iCEQ74T+qF+ymMincdHgA6ZYFn/lkgSNJypJr/rEc/pN5oc73E9twlDqHTPlSn1UGvN8DIt5+3nSTwd+O3XjL/whKPotT02IdKlZ8yjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139490; c=relaxed/simple;
	bh=pC1CCyXtvN10xc3N5sbvGhGAdLjozRH2BPe813E7lyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XttqQqO0KD7P1ujdJiBXCNBjeByMjizesf1T/oO/9guBfkl/S+E4iwwpMQSlvDywr+D8Pi1HDF3nqbIyLJrtyvlP9AmoAWsAABbOb3WLh5hk1ySWlorN4cdpB5sqorREsi0PG0vqqT9/HEMAmtUQNnWR62lj8IwjC/MPhsp2PxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlSo1t0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtHIz/rY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlSo1t0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtHIz/rY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmASo222587
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=; b=NlSo1t0VyetQAfcG
	0KZZL2ymdWwewEi3LnrO203oDKoNdt5vD8bkMO1i2hn3XvJ5dHFoDlcU84tWPtYP
	s3DxKXwEuVo7C/yqDkWKspOal4hpw9RemuOksseuF9+6jQPGplpV0lECFdfSDe+2
	BlLlUaKS0LqLIphK0LQNDQY80pt+kz4uOW0JsomVu4vHseN7z704jOCXutDS+OIE
	WSOTsr7ym/zto9R/TrfcARNMQqyyX15Pns1ZG7LEYAvg3E1vJaEXMo5K2Mf7PWW0
	qYPiEU7jOXQomXY8QkjfXrtFuV6no43BhY34O40duMjjbmMLA81i2Xw8QdGJNavg
	MiFRPQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdracfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:11:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86b80d42de5so728266b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789139486; x=1789744286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=;
        b=CtHIz/rY4lMZvIpDhWAOaiyXecVRwDhxuGplM36dpPP0I5KmuuKep4mkrXUZqUGACo
         KLBI4P9sJhAAtHeOrKaChqq0qeNAFIJ0su7MWLxB9lgWfwFJCB+9DKLnZcWvRynT9TXh
         DXyDk/ncggBQ51QWe6xZ93qTsgbMH47wEvHZIrIGr+Z/nyXbMlMMTzWSAPAMX/D4c9by
         eNESXQuNuo4MK1bIcbWXZ39CJMvXLwcPByE6WuOwoNUXD5+IsCZYuMlpt1xm+JiUCj14
         7oEzC2T3KCImni/F+rP0pLT1fGmgJWZFI2yKdHseXKhfkOxgm1jqV+j9UKdIyxR/4sbt
         A3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139486; x=1789744286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=;
        b=kbU89WberPPqxpUl17pybGe70F6m6CefKmOg6sa142WA2sVc76hRod0hvUDyZ38wP+
         EB9IEUy0TyzR3jExerBOxy43+35YnvbTxkfIIoNvHBjfSoE5guxOb5i5C+w6Ap6umHVi
         iEVhgE+mA/XZOq9D8J+sah8z+rZGOak9+A8BrRGls84Y39BDRivhWJfauTNLWxfdQ5fX
         0PSweh+zvtQY7q4J3+YzGVMBRgNIU2cuP6mzNBdPsyqRpxZa6xLSOsktn+ONhYo3Mlbs
         OvImNWgtuQM4PxQOSNhXe3PKSUpjwnSSKw8kSL6OJ0Qk7g26EJRwpw8y8sueU7YU4tTg
         RmxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVUI2VPS+5mEfI4AypvezqWGkYID4Spmr2ASBx75lLweNILniv79fYjC9T0cpKO7/DUY35LdsYol31+FI7@vger.kernel.org
X-Gm-Message-State: AFuF++nJ8Kb6P8QO2cWjgmqoXOnbvopxn/QAn6s/QqgG3EZqUMPesowG
	3lmjjWjnr8qnNfMCuO7Zj1TqxbVT4hHdcPXQo+8yHualElNSBBkh0Z6b16ZevERC4hJh3lHBqPK
	aoklEaG4h28th6bIi8zckMv31vIenGkE2m18aftghZeg3XBsc4M2Deup2faNUdNe5DH3A
X-Gm-Gg: AYBFou3xPIBzGoj2XSp3da4u06GqRuBYvVrwB1/HR/rb2KtEO73gU2XypCazXT0zz6P
	CXMUnf2xPihnsE+ic3UCdoUUc75S4dz7b0ucyD8pvv2peX4cgwTLf3IDG+nyJuiewIErsqsA3EW
	vrqzhtCllvmh9PJ25vQhqv7SlqIsIQA4rduh/Un4cVhQGw+9v5Rp1SG/4BnUWTQQfHpSTnR+Cqb
	os2/RWUy7vWkzDDKyVnNQqJVx9iOOOVMRHX4b+cNUGd+p4WDIG13twxF8mO9cQRLn8bPTOB+RsT
	t9O5/AFvYrREG8ojzTsmmtbZ2+ahl420H3POtDTsGFyhtlQ45KPQWOWJsICRTTzIRv7oMnnSFjt
	KF6S6JtqACX2m1x1iobxgwl+zVhzSR4weeA==
X-Received: by 2002:a05:6a00:1749:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86b30f12a74mr6902281b3a.2.1789139485947;
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1749:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86b30f12a74mr6902226b3a.2.1789139485522;
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
Received: from [192.168.1.8] ([122.177.240.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250c1278sm1268447b3a.8.2026.09.11.08.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
Message-ID: <a9d52219-301f-40f6-8af4-c0dea8781dd5@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 20:41:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
 <20260909-devout-generous-oyster-0efdef@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260909-devout-generous-oyster-0efdef@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gAnEBgTRefUySeTXpdWdkIiH71Co_PQC
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa41a1f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=3NWKqmDfUQ1iRcuN9QhctA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dz92lDrrY3zvL3j2_bwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: gAnEBgTRefUySeTXpdWdkIiH71Co_PQC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxMiBTYWx0ZWRfX1/iQ9wiFO82q
 ZLAU8qR1YzcT1W0d3mOiSUakJS+APFVT0r4h+sf5sruzAX8CSRQ4TcuQnhzAJyTyxIDUlhuobGG
 ILU43Rm18XVWWlI+ZKPS1wTNP0hE+YM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxMiBTYWx0ZWRfX3faoI3rq56b9
 m7t7w7HRzJSU3GnwtnlnDbYDOQzXFaN1JVxFXHOVGGrhQMa72EBs7N2/gH9ELVAClA76ppED/Ub
 9U8dDwhqPpHytDTSi+xtqKKZZOtpxyogSehXCqX6p0EQpwfZQZ5wohhxH0v7mgfjNfPr612P/pC
 Laez/KyAp1SXYtjV+P6TDjxMSax7aiqhEBwYtJI5nsYUyWrcJu0kL/3H8T+bftK6gWoy06zHTUv
 MP82VDaQv66UaEjuKlMtGICINqqK89KBLST5spWCK7TvvxEq/a39gS403iVDDsvfi4WE5faDwYj
 rOZOaUlZLVca18AzcRCsKTxH2cvHmMnN5XYYYNYTUkx4h4cMVeH/UqwN9xqnq2vLmz+7wPgkEg9
 weYgrOJizJHfV3YeBfzoiDydIUI3Z1uBo56zzjr+0DguftB1A28gj/VIwFHWDz7Y7YNwzvX4UEc
 2AdZcjzoBkXBOB85mwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110212



On 9/9/2026 1:00 PM, Krzysztof Kozlowski wrote:
> On Sat, Sep 05, 2026 at 12:20:42AM +0530, Jagadeesh Kona wrote:
>> UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
>> TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
>> to reference the shared clkref on Qualcomm Glymur platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
>> --- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> +++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> @@ -20,5 +20,6 @@
>>  #define TCSR_USB3_1_CLKREF_EN					10
>>  #define TCSR_USB4_1_CLKREF_EN					11
>>  #define TCSR_USB4_2_CLKREF_EN					12
>> +#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN
> 
> I could not find usage of this new ABI in your patches. Can you point me?
> 

Thanks Konrad and Krzysztof for your reviews.

The above ABI is planned to be used by the upcoming Glymur UFS change series in the UFS DT node. 

But based on the Konrad's comment in this series[1], will drop this change in next version
and use the TCSR_PCIE_4_CLKREF_EN in UFS DT node and add a comment there that it is intentional.

[1]: https://lore.kernel.org/all/16ec601e-68a2-4793-8639-b899f31ff819@oss.qualcomm.com/

Thanks,
Jagadeesh
