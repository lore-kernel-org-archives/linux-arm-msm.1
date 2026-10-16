Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240AF3F888A
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155154; cv=none; b=LQl7fAVLoRw/MEpd4oJsobyHtSdcBfRC5cAoEjpjj3sCaJEEOg48njhT9Yei+h6EPJ0ioTVzjgRAwFD+3DhPXJIXc1iN/GTaCtvBlk5WtyTjyeWuXYE82fdkvhcRTNyWcdTK1f/dlUenUkya6jPQOzIOkC/YFga/t2sf7X6CjMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155154; c=relaxed/simple;
	bh=QGqaZ7i9dKEfrVnbt6JGQYBUklOVHj32bMfbdLDrZn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifN2agx1G/YYJIMbzfaFROuMSsZ1VIIM1u5DR/L3SQYR26CfF6VFx1wh+8FiqJCgVdPgh6IK8HJSEpDbVdvpcywGrBfNZto1/NJwpZvwv2ow1sU65Z99oqjUiCLqy+e3WGdMUOKOh5KNsDZAnNaGT6P6Z2vFX1W3TTDGbX6IpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BiCdtCix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQnl8jUn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BiCdtCix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQnl8jUn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAS2U1794089
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5p8F5gLdJ5GtjeEk2HF7/oDkM2Pu19Oyu1v/XHNad0=; b=BiCdtCixAewQFR4R
	vpWjzHDOou7cC31j3b5syQk6RhdCJ2MhpgMPjPQdl+TtlShBREQ0z7e0zJFyS3Jg
	IoXTjERN0ElN1okwlwXibUYmGXOh7N4lV6zyGdzMtyn1ie23bLxA5RNWQ4x7cmdx
	wjTMUZB1H8yyuuRbwUwIHBLB6jstTIrmF4q7zXZjbQXivlhvSIlrI69Y30L0C4DA
	ScYkLJYNAa2OZ9HXaJOTuPtcaOhP5uBdvgSEtsFwOUNDd7xgh2+DB29wWX5bvCPi
	nkcEBtHcxhvxd3s9e8cxIY1QGE0gjnyaVTivUBx8kV0ZPUnf6m9yIB7t2gcXn5qM
	kM+InA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3seurk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:52:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so14652025eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155151; x=1792759951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5p8F5gLdJ5GtjeEk2HF7/oDkM2Pu19Oyu1v/XHNad0=;
        b=DQnl8jUnn6gQge69SPfCwsAB0pWRbkqDzAOkpFwWxFA9SBrNqMYspkX5/tvyLGG6to
         vcPEHf1gwJKLTzz4RYiypA72MKa0Aw9Q+iVl+ajrRXIkEOl+hcTYAO/pGEopbikpGPl0
         LgpmdG0P36ONRKF2XeGEKBv9V8xz8JkmpGlaiynsyf0pAITsMsV9iEo22OPQQ4w7mwt7
         LfE76TA04kWzNJ0tZAr3IrMzv6fBJybKFEtT47gQc1/DraHqC2Pv7gUYdBQIlhF9r0v1
         euAmZgkOkJMCtSkd9Xaq98vgZ4Ws6ssJ7QDd+e7ZTGih80miEz6KbfkBw6H1Y+Q/EEXE
         7USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155151; x=1792759951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5p8F5gLdJ5GtjeEk2HF7/oDkM2Pu19Oyu1v/XHNad0=;
        b=fXu2PQ6fZzIQOLY/CsKfBO5i9WR4NJRf6/yw6iRdxLOZ4c3L1BxlJyATucDVysVAw7
         p34YwuXePn/QGbAFuAIMX/JNUxaFXNc8UhGRrbWY9m93OSgOSmPic5P+FcucsuhzXAoF
         n25yWT+oRAXpOJKP44CLg4cC9O9h7e7M5iU2GDOlDjeEJTDDXTPh9t2cNNPWUwsI2ddI
         DIIi3Afmtfx6GNVK72LUNOU1ho1hrCu/ljTaYSneIUjk9odOEAAnpikX3rQPSothArI5
         V/3N3WRRmOfycZTRQwNi7voYxxLaLqsU99tUuB2yTgNgLmtH46gJn0Hk389mL2SkOHA+
         ERBA==
X-Forwarded-Encrypted: i=1; AKwUvBxWH5FxIRXL98ZCy57ywmIIvr4nlrjW3Ynabdev379vtGMJVyxzE7D3aqEDOCZ0Watm5ZPIFE25PRj85YKy@vger.kernel.org
X-Gm-Message-State: AFq9FYJLh6POhM63gHFdS7jKTHeIaLt4rdK0nd2XPFCLORQB+o6iOJy0
	d7fpL+3yqjn2D5efxqxdqCLGy08iHL/KUBT9mRKPjc5wozHSIIhHUDiPRrlma/xSnRYvFyuLWQe
	Rd9sni1waRlDCq7tlX2uKwMqB8kGrxVE7sPXttrZteeFZWOEz+4UqIZF43Nhm0xs7/inR
X-Gm-Gg: AYBFou1NfBalFAmpnT+r9jlUpAO0G03JMCKwVvmm2oe3iX+VACIN5o3VYneSaED915m
	bI/0m2YKZU8MuxraB7wAPCHkSTBxnlI5gkWADM4TKsCXm7iVBUwTuYeQM6G6Zk9JRZbnnsbnHzA
	ulwyEGDIb06p+FATb56G/e2qWHaBvfIoD4GJdgkXkTKcf0qJzRkKYW55GHctb5VnhSFTNDakDGB
	4hvRkz/2bBZCvf3IDxTP1MvyxgAUSejeVP7+bqtsGwbE6U7XE8eEnGImueTtb6YowTTMTV3gti+
	eESsT6vfmhT9OKHzxH5uXhjwZzz8/ELned4bkFsdixS05QxJGrB9/OZGWMEseUBe8oxK2Qj9R2X
	vPLNRjUNtlrYH7tUCnb5za97Szn8iJB4=
X-Received: by 2002:a05:7301:1929:b0:351:7ec0:daa3 with SMTP id 5a478bee46e88-3537e04eeb2mr30724452eec.31.1792155150961;
        Fri, 16 Oct 2026 05:52:30 -0700 (PDT)
X-Received: by 2002:a05:7301:1929:b0:351:7ec0:daa3 with SMTP id 5a478bee46e88-3537e04eeb2mr30724421eec.31.1792155150391;
        Fri, 16 Oct 2026 05:52:30 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm11558273eec.12.2026.10.16.05.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:52:29 -0700 (PDT)
Message-ID: <1a11724b-3f2e-4c4d-a8e4-eb9c0dc3c18a@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:22:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
 <20261006-shikra_qce_fix-v1-2-8ac54d81edb4@oss.qualcomm.com>
 <18d6a6ce-afc6-4590-ac26-0aca6dfafae7@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <18d6a6ce-afc6-4590-ac26-0aca6dfafae7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2RFTqH3jGfw56CRwbLXgxFnp_ypOVtDR
X-Proofpoint-GUID: 2RFTqH3jGfw56CRwbLXgxFnp_ypOVtDR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXz7h/iKZX4p6O
 2QFN/A6VLYZypqsJcTE+p41Nzzg+JXoSw/EHDjrvDpI+QL/peFJSc569V8lcKBSQsvU5R9N6hnH
 Q+RDL3K70xS+o5adSqVFWN7ywxIlTOU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX8w9EubPtP3+t
 awhjxguEEA8u+2J5muVnL+1wFPmqK22hQI+8TvsjN8Ne6ALwA5yozvHeddw8lZVaGvJ/1fIwx9K
 COl2cOO9004XxF7PPrI2f9/suXRO5EdCvQKEXVYhdn0YlucUQZwRhPmYIjA6z5zToe/xYZKIJEp
 dh6PSeLYdaHPkA+I76Piu4Oj6ErGl+fVXb5sQPE2mU/KWr/R2xRbbfOuV5HTxDf4cPqkAoGmU11
 7aM5cwj+BQvkOAOuFf3rlMRifiiD2DPzdIJNaeWQbQ3uCXGBW0vt89xmmpXy00miD/GfpAdWPpm
 yQGJOeyR7nj7yjkqEvFB30zAOl6X7ZmcFpAFs2r4PjiuPU4x4VACpv3cOZxWbt2C7Ojgoot1Y5h
 DgrFkUA/QvpysrpLxces5Nm3ZjRBWi9xumixmdQNftm23whkC0U6y8txQKe9buYr06h85w70Ir0
 pEW7tGRdEiYJtDHUKNw==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad21e10 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=9GsNmjbEMOpVDnpVqTcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

On 16-10-2026 18:01, Konrad Dybcio wrote:
> On 10/6/26 1:14 PM, Kuldeep Singh wrote:
>> Shikra is derived from Agatti and uses the same QCE integration.
> 
> This is useful, but..
> 
>> Update the QCE node to match the underlying hardware implementation by
>> adjusting the fallback compatible and related properties, including
>> clocks and clock-names.
> 
> because the compatible you switch to says ipq4019 and not "agatti" or
> "qcm2290", the argument falls apart.

Ok, then I'll update the commit message and avoid adding agatti context
for shikra changes.

-- 
Regards
Kuldeep

