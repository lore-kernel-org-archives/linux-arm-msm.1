Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA23F413A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742773; cv=none; b=N1c1q9RETu+nOS2rSyOfKxb2Zg95Wn+V1h1M10L+T/d5OfiwLTIP49nAsqu1ZpfR/463u0ypUMuFcqYX5NXLM3S5HUJ3sSlcoAAPk/en8rfZy0nWof5OvuNmfj2VJRr76+brldEqrbt67ADhGj/Htgjz5aD+P3RIDxG9D/EypwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742773; c=relaxed/simple;
	bh=jW6RtFd35Seo6Qx9krbGEXE4lvO3sNbtoxrt4DdOfFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRR7RtY8Pzkk25KyPzw4xS24RpWo5qoxElMpDcQD3Bqbzz+orKAyuHK0V7wyBQKej4ZcGYsylBaulkzsgL3Vi+/4Cmy/BeJvmQiXGvSTvAgIHygjLoW7XNPpbg5as6rbt8eMRUm1RCB8T0j75QdbgqkuM7WORK8LFlS1giPzans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQTC4QwB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azE4/Cfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQTC4QwB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azE4/Cfu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGqMx972277
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4ZDYnGQeyt63uA5ruMPZWPKH8jP36BIfRW7bNO2VFY=; b=gQTC4QwBd2Rkq4Wp
	KItBfe4dCR5EpXFy7NyIbZpcXMV0pct5c9q0RfTb8XWE04GmQrwNzIas7vRRzuK9
	RrOmEZbZnc8D0VDkyfrMMEPJ8hg69o4SKdldp97gn9BKsZ9dc6jfUpRnI9qUZNeZ
	9sBCYsizMDPzPjtGEUUxuEV4c0f46Exg7tn1WCaCkOLIfXxtimrb/q7Oamy8YeHF
	CyT3HvuPdf8ElukrEfd7YUXcIxYPDkN59S5l+wz2bsPEp4aEEbDrZF6CuVMGiSlU
	EmyoluJ+CXlFzAHDDFfOFTOU4+cAOaYQCLUB5LraSfUmNES/sfZL65ICjVwQMowi
	Dbwk7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghrae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:12:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so13608765ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742758; x=1788347558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4ZDYnGQeyt63uA5ruMPZWPKH8jP36BIfRW7bNO2VFY=;
        b=azE4/Cfut6ut0OkRt3RxiRcw4f6pv8nDApPbUxXgeDTB18XF/jRxbFFSCI0VT9GCrB
         PbFu7dQTqS6KhfMVT9ybd9YTKqbCej+UDhXOj0gfnJIGcZrg7kOrz0QlEMzcXJrihjgP
         nDRwB8V0H7rIjHdoqwW5Ixx7v77oGtT+xnTrz0sacejDQ6tE7H0TQHduQcr7dbk11QEr
         FvFeRH+xMKqgRdRBpfFiarKeOGrqTE6GzZZvvaXT5nKpVFqrecGO06yUkI+10To/Pd2J
         HTBMqfDjFG1ET9Kw635qEW23xu4va67u2Gla6ic5RHGp2bMftka+vc6arVY+r5IMIjbk
         GSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742758; x=1788347558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4ZDYnGQeyt63uA5ruMPZWPKH8jP36BIfRW7bNO2VFY=;
        b=KSG/KL2nVZY5Sh2Vr9ci0Nrwd/qoVIBYQmlwQjL6Iw/lxzmqBe7x1zjx5e3w7nUkvp
         SgIeI0AprXckV9XQb/+B4LtlUHIP6jrdSzajSuwYEKkMqiclbkHVEjHFaRh9ATS8FkiG
         2MyqOYjJfsNBlgmtvDYnidKZ4u1cRjSBw53SN2R5dR2x6kYs4w2zn/j+K0kjWDsGWMcf
         lUKH1rLhPf/1YMkgRmSd2Z4fFk0gUZ1H3QmsfSG7jHFzPZBWAQSofl+8aXHJeeQh4Vvl
         XgqUYwEeQqpUpoyhVBBtIPazB6cVMKGX+yr7qIcmsmcS5J2EKrT8bXHVcMSAW0bjPHN6
         lJqg==
X-Gm-Message-State: AFuF++lC8jogx7COQHxDh+6I9bk1EMaTuLsNwqEZ2DO4h7fKKUQcQjiT
	EQ5wYQVBUVnVlzwFfi/N+IWz9Q04TtnBfCs5BgkJP/9s5jBTf8P+6HtQJV82y3cT3a3uASdhodE
	0Rb2SVgOsNB+2vyx0JCHu7jSY5r1xG87uot6Zv3COOSkAaXdwO8sljivpJxszw30Rl2Qp
X-Gm-Gg: AR+sD11C8K6gfjifWl4xQEBMpYmmdb02xRN5tPyxzMmyBUhkZ6bll20pSJpqmssZ10E
	u2FDwvxo2EuKbyaacpij4DxtWYHv1KTii5xZx171m4UgugWMNGxT4JoqeQv5I5jhVWmnM4Xsf6I
	HqP0numfpThfPvaXbNH1QDA0i/VxpyNbdC/KElo2tmf0We2t2pYBM3CFKlHQ9TnbiNEkKR8fkz7
	zQ2uTFLUuu4pqf7AmGC4lXpSiB9ezGUjk9M2wIqBWnrPOfxWYe042VhSdbBStWk/uSIE1l7jZbE
	SgtiAs76Enmh+2ahsPiXcrAJbYrRVHF/+XVjI19kih8FCdWB+WoTCZkgfSDSxXiY7hIRbqtkA7W
	irJzH7idAAMVXTOJe3TXIPENTt95Ujow=
X-Received: by 2002:a17:903:4b4b:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d707a8ebdfmr113295825ad.6.1787742757579;
        Wed, 26 Aug 2026 04:12:37 -0700 (PDT)
X-Received: by 2002:a17:903:4b4b:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d707a8ebdfmr113294385ad.6.1787742757091;
        Wed, 26 Aug 2026 04:12:37 -0700 (PDT)
Received: from [10.218.21.115] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8861ecsm7609153eec.19.2026.08.26.04.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:12:36 -0700 (PDT)
Message-ID: <4b7abc36-4ea4-4dc9-b462-299e50c41176@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:42:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
 <82fab943-2994-417c-929c-7c416386adbb@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <82fab943-2994-417c-929c-7c416386adbb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sAU1UONaP-5WBEZUrxiZtX03qBxooZeG
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eca26 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s5PXVsNn40BVIwAtHE8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX5ci0h44exul+
 rPEVLbr0K/yu92vd6Cj2TSuXUzC7AWxUBipaoZqTj+QTVJ2KMXZrn9zDCE9eEuXCwhUyDsk6fSj
 SkCdF98Td8bNfbQVZ+EgE8ghk3jsyW0=
X-Proofpoint-ORIG-GUID: sAU1UONaP-5WBEZUrxiZtX03qBxooZeG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX9b8sNNM4LI2c
 d+Nwc6uX0WRiGBlAbAY0k53pkDvR1Rd3ZQaHU7Txfou01wrTAuUB9UOS73ltzwkvCHkzJ2zXvu5
 qegqCSqyJvs10ObSOfkyDJkVNBqjueMW5D1fVSv6zTg/T1+x1c9GVuzRIAdkyTLk1EaBHaWecMT
 FPBWOIisGvHa7IeCZSWGG+8/WU2p7OjU1+lzqn6gr5iGU3sJ//mB8GJ+16FnDVc3KuLn4GJcWsG
 TVKJHFpanqukitFtcJ3k8aLQEsrnAxQsBAE2d7gBm4xYqHBCb3guL3tVJE5OmVi/w/8z0BQJeJT
 f5q1BTd+RIlNjhKFyzz7XNaZKzB1TW5q+1XHiZRm55/JYRw0x2n1xMAjNTOObaDs6+pCSK+39BQ
 Xul/cgmyck8q75Ov2LJ56yFNnua+4H01iKv60ons4inzxDt2QX6EV8c7QYbLWUX9GY9e2ytKQLb
 1W3zQs7NtqGaWMnjQ8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093



On 8/26/2026 2:41 PM, Konrad Dybcio wrote:
> On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
>> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
>> preventing Linux from accessing SPI5. Removing them from the reserved
>> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
>> for dTPM usecase.
>>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 -
>>   arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> index 8ac42ff625a0..fde7fc035bf5 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> @@ -197,7 +197,6 @@ pm4125_l22: l22 {
>>   
>>   &tlmm {
>>   	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
>> -			       <14 4>, /* eSE SPI */
> Is this bus going to be concurrently accessed by TZ?
No.
>
> Konrad

