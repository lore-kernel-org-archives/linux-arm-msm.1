Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2647A0B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078869; cv=none; b=IBom4genwX3F42yWcoK5aFigPuXHsnPHFPovbnsacESOiWNT08cyP0R1YjhVitbHzscYkgmbM+OveFBME2FvgqoQD/pTC9CR9v9tWNc0IM0/DYrxH4d4ve1ZOTvRQCDRqPfY8hh/z+eL5PvFsuBywev43lq5xhlG7NmzYNPjOGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078869; c=relaxed/simple;
	bh=TO/iZFkFwswzAF+yEhGFEaj1c8z776aBTq5j1ZXADlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLQpCKtXo6oY3Gwt3pWSfbc3WmC3uq+6Jg/yODIPnpsvNrBY+p0xEROc7p0jDsv+BPhnJ/EMMGdfTLLrdQNaPJ2KLEy/r7MCYjG2I6PbriMkyZPKQGbiqYAtRlqoLZt1uT/Atl1UPzeopJtzYB5eVrqv96aLZBp3wElXiQEWeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SE4yMWaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xpg0+UFp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SE4yMWaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xpg0+UFp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPiZt269300
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=; b=SE4yMWaGoaYDcRFj
	PjnpZ6e2N5mqFRASOBsWaiLFxrmWzXfcIEV13ibp44euS3p5yh9dd095S9rtalMx
	SJdiaWrDgPKbEV3D2AMrD5YrTevCMbHDHtAM4oXnlVwv5DFuVrmgl7Fo6Jl/vQCG
	FySren71Rs2rUY9jtvzA5oKJDIBnyPgtFacWb+dBN7Podz0jrKgj0sUnIYy+3vDm
	knx8W7b8PjWzC4Uzz6Wz4Gd8FdrADbL46+B7v09hwAdBTGeHqhzAixpSQdrm5gA3
	O/3d2XFK631Utdf1gPjwzKjLgq/o+hmlb6r3U6LYPw8FFcGSUWOB3+zPXlvIEBTL
	A8Ejog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbatfjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:07:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so7205110a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078864; x=1790683664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=;
        b=Xpg0+UFpN+oX0Gte/4R82IHf4vvFE0q0vwPjROuiT0/LC35FSyL11+/LgrkeJR/Wlp
         sH//Ywt2BaHr4hui09f9Q/W0PuuTZAUuSkxaeJmZ22g9Cr9jYlyEHU5+iemZ1gJ9hsFo
         UBCFoyB6uxIr3irABCerpbwpO+ragpeEmglp9I3lezGbNSFjNNn0//DbvPK8ebz6q+O2
         YuptTTgOCI+CMUKRqg+aEG2BV7oWYw2yHG00KTZYyJSN0iQjX80v1UBvrs05Xc1KiAhl
         SKEUYo6JIx0+n+COPZsPpqAbb3lw2eS/T/DUMNTY3STvZPR/Mwo4uyVieVRCjCRM1XRs
         f8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078864; x=1790683664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=;
        b=P8l75p7KzJraYX8L2Elu3dCNdqFqtQeeY7vwOVqqxhZ/6N0QrdAjBlCUhW0R/liXZm
         v1wEmBRm1a0IyL9giBnUQCIMlUwo9j+XNTJ2BSn/N4sbD22Y/cFgwtyuot67Xp8srMhE
         3Kb+IYqVSdvH7SDb02o5MsfEQ/dhWaNYQ8GJ6/la7yDPBBIMkQvXOQMDcQxfVUAwjiYi
         Q+xV3k8ekZWRvY7BoHj6qxMR+RFAVZZdQHoPggnY7xgTdrRsk2KGOAKQQGPLileHeYM5
         sbCsbUcPpZy4B2GTdHLEUTFfsn5vtAFxAmImb6TB/ImMla4HRtwEnr1VVZB5wsaitfig
         Rlkw==
X-Forwarded-Encrypted: i=1; AKwUvBzGqiLKZocioSwSic6OOOyMlxn5hHA5AfA2snnkZt4gmRn5Ly8khAMZu83MqL2nkkAgG2bkB6zSEJYt7L4B@vger.kernel.org
X-Gm-Message-State: AFuF++nl72qF9dlj7SrBxhU7WPt8Zn00EVwjla5TY80D14TrcFpsTSGy
	J9YTrfNrdQcjGWaiMNID9hzLsyhW1lbSP8+hJ5MwXLyvC3DKy/pg6KaR8apoES+ou8puBl3lsK+
	JvKm/ylL8RIb5bXBeF5mZpA3P6wJN5fSsrCTmMd0hrkQ8AEWmJU6XiKoCxpeB0FzqXzjj
X-Gm-Gg: AYBFou2MY0NF0DShz9XpZWvnOES9Vs7TQCU71V8REeLyB3whrm9inzwzHjJXdAVGbyw
	gH67M5Z9q0Xp/7l0+n/1cY51yjKhjpKAhIIgieL/pR5D8DxS6llZm0xqGxPOujVnmTSU6Zrwtlq
	LVHJO9r3iboWtE687ANG/hv09tP1GeVO76+zzSsnGzAoYQTXL0gDO8c0pPoimCMK2zBbNPoFFCp
	IMB20W+PJE8d+ppROF/TsWP5/EyakMYijcOkKGkf4B2E/iVm9S795V3KdAZQdqt31ACr+ea/j+Z
	CL6hUfaz9BnMps7aLaS4wWpMK+6rs7dA3+p8VHLHLhL+5rCROd6LeOvFxpy4Lru/AABrt4++kl8
	fb1I65xwmA6S5TfJGS2XylBiwwls=
X-Received: by 2002:a17:90b:2f43:b0:39e:4c7e:f03d with SMTP id 98e67ed59e1d1-3a073116f1emr982110a91.26.1790078864202;
        Tue, 22 Sep 2026 05:07:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2f43:b0:39e:4c7e:f03d with SMTP id 98e67ed59e1d1-3a073116f1emr982070a91.26.1790078863481;
        Tue, 22 Sep 2026 05:07:43 -0700 (PDT)
Received: from [10.219.57.63] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0715e9d5esm2483450a91.17.2026.09.22.05.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:07:43 -0700 (PDT)
Message-ID: <077cf4c6-9657-4e4e-b755-2f45a9fc67c6@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:37:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
 <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NSBTYWx0ZWRfX+ySt0r4DIIih
 hr13mYRZHrRN+bE6vylmWeMUpkpvUBEj2Zot7pjmBA6j4TdMMe9yhl/TfJYwXM8s22c9gcFl8nm
 BHNDfQBlzWbMEtUXt0w7WDvY1RFJhnS6oDad7BYEWFq2TvITEoFVOjk8l7M0ZLwq79gR49nxJxF
 3SDVoCXRTPY7OB1D9/n0hSMehbAU5IHOLhGKHqFL1XabWGrTCEdYhlQrhvvpvCuf0nXMOdOOpl6
 /7O3IJKxV/bNtG8HlvrCNAO1gaiZuZ+k7K7kW+bltvWCQVzlOEnr+k6bGoqw/HHsj+bj+Mk//aW
 zcdYezaGGxYxqJ2kkE6RAX648sYVypXvB2L70PuYgUnGF3kB75to9jtToZqFNAdhRZOr2/8wClq
 VhRiUTphsRnkl32e04O5xnrmWoCIu7Ljbz8M904Noef7jtW+EUrDlIYYggD0JHo91Ha4qfAudVJ
 mMkPxlaDZNkkHiXQ5HQ==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab26f91 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SYeg_LyZQ0ZiSJgYx_IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NSBTYWx0ZWRfX19WVTQcvetVU
 3ioSoCU4kpLry1+nAQHzRlpUb2r6S/xBRaSE+OmWWLXn+3iU/5v1CUqnUN1ZmCIfLtXPWV+vrXH
 KB3kVy06Syu736jat1ltVFNZKtU6sg8=
X-Proofpoint-ORIG-GUID: y20dmkRGGtJ-M3i0w1U8VnoBuAtPmQBz
X-Proofpoint-GUID: y20dmkRGGtJ-M3i0w1U8VnoBuAtPmQBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220175

On 22-09-2026 14:31, Konrad Dybcio wrote:
> On 9/22/26 8:40 AM, Ekansh Gupta wrote:
>> The reg value of a compute-cb node must match the SID (the lower
>> nibble of its IOMMU stream ID) it is associated with. In the cdsp
>> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
>> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
>> 14, which don't match their SIDs and leads to SMMU translation errors.
>> Fix the reg values, and rename the nodes accordingly.
>>
>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index de7c395d9c35..51fea666efac 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>>  
>>  					/* note: compute-cb@9 is secure */
>>  
>> -					compute-cb@10 {
>> +					compute-cb@12 {
> 
> The unit address is interpreted as hex
> 
> Konrad
Thanks for pointing this out, I followed other DT files for this. I'll
change this one to hex (@c, @d, @e) in next revision.
