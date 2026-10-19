Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450581;
	b=WFlg6J3LtkRB2CAiH7N9qZaSF7WdubFy3elSQ7YYgz2nWIFKbvmwEbbIJ5jw+iWcxvrQ
	 Cdsof1r3CY5J8JKRSywcHFgh6mwP1N3r9T02Vv7MRC/Cm2dsm3n3Yb9D2pigvOHmjaCtf
	 yE7rdeTzaxgWwFzSkOh56akthjLI1mGr+UD9iR7deKxjxEEgDmEiCMOdXPcktJ+BQr2Ti
	 J6QPABQfhaCN07HN1DM8Acnjg8g7RmIvGAjisqZed88k+7aBahpGIg5yj0X4XtGBgiHTQ
	 cHFEHLJLdouM1V20QDyA/3cMFEbjqxUub3TzpEkQRMiUcu8BxPkU6uxnaE8JqSR06jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
	b=Je32tGPyKvKJkCkqVLfugudb0dAd0tC8UAhJWTOIfCilzCKbATS0QUg0d0wB897MruBU
	 cDEJNO399Yy++4R9K4yPWpWSYB0+0mWZRGNMa+v5DkQMmACFnqVJjdcg6t4XDpackTMdB
	 ZKtdzeYmCE9mMFSxnyvl3a//Xqh1k6WFheLM52NHWsjtsL5+zWvOZAuesruOKZGwBIfPG
	 Xwoni6D3MFF6EWe0LPr0wYWO58QCX0cmRYyb1VPX9lceZrdRZvJsFfV6mPXM7j+WUmtMV
	 mG5lL0JLTeiIDHAltYQ/toA3qRJPDaqicmpRX8CJzEwE187eqdqUbGgatOcnyAgfw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPD4U1pL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RM/6oeEu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70BE606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPD4U1pL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RM/6oeEu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZUdq3389790
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=; b=ZPD4U1pL9YDcuEgT
	jupiJVi6G4tVmwh7ySlS2n5pvnbzewTfF6+YGf1q0twWg0NQAIIyUPEkMAUc2Gew
	jVVZZIZGkeeuHaDGtsPymIgLUMwLUcBhz3HZgEd4QubCoUEKxyWszm8uJ4ubLm/I
	u5dguqWtpJWlFykb+e+QXZ4ukLl0VND0s3L+ZAKFjd4w9hJDt2PG+sgs24z/WzHc
	pp0JOB9yK0lWVIsdbvFkrIs0p0EOlOlD6wu5oINLtYDxBtIQo+avzImffnsnSjZI
	CTsNogRzC/5cBNHeU3QRz20S/BMSrtXhKArXbAr9sk/qqGV9KpC4DeK6j1nfjb99
	Km8wOw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr4q0wv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:56:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso4285917c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792450574; x=1793055374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
        b=RM/6oeEueDtBfSl1qWx65vX3YEajsp+K5oPstSZfbJrJ62StbRaFmjnAa0njkwGqsQ
         VAWAfxhuxuBBlXiypreh5iG7PjLDh1wOyZxM52Zdf2hVekH+Zzl8TNbGOntQfscKa0du
         kHwOeD36BLzDKXHdQLvQ9grcIJjCUUPp8Y7ntUM1afqgLtK4TGtgGbl9187JEZ/JBnQZ
         Efa2UlZ84Fh6S3K+UR74uU/pRP90ZK75uzBhrEqwJJniMGcqq0HWfSqk9cDwEb/m0rBi
         EOAkVXhgF5warnC9+IURC3oyzjimxRKNSPECN6tClhubsa400clg/qZh2ckuSY39Tqih
         hCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450574; x=1793055374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
        b=ah66y3R8Y6B7bbXYbMCzw7QO6ZgrOp/57SuevjF224JJfQy/bhd6fXhI1K5LPtsMwQ
         2J5udmoZwmK1sIOfykVXhChjYrCADsV+SI6G7mnppQP2kaJo92CSzIn+Yr7j9ODqGdwH
         RHceKQ0AWKn1dya1kevshDZTfjcu2IfWARPqlH7PVF/lGVNkwiWV5z3PafzFfGoXKm8S
         DLqqzdeZGLwH2AOnnnvYyBA2gLz04ETq1e9ssJBuPIAfBtEXSxkOG6eHXZV0mDc5t8BE
         yJFYIjucXAtVgRkQEHABlwTmLByYV2bftrKmFfURdPy1M0rm2ERC8q3+DdltYo/aRxaM
         1gnQ==
X-Gm-Message-State: AFq9FYKgvSCKH7QTnS4uOFBsw7IHSuS+uRrpTmqIQAD0Z80c2k6ayzFo
	6nkEamrGf8f6KFWW1Am3/OoZD0b+v0nPwn+NyIBFU532qzsPH1KW5p494b8q7KWZRRVLj9sCOdo
	zeSGNS/rfn2Aal71WBeHHUyX2IgH/v7M/RD/U86hZ55rXYhX5GTe8rT1zih81w4iDNIJO
X-Gm-Gg: AYBFou0nU7449x/GEBHCuzce5rAN8JQck5dAFqCU1CIvN5899AqJNVshP3diyRN+xMc
	uOfPdVMD0SSiFZx7CMtdKguH56mGbyPJGx4hI5c0ck9mnTseIgUsRNQzbTsaI74+e6f1XIHQCmM
	Lyag0h0OjmB9kquH1YdLgrfgkX13Db5rQP7WqZKD4tmq1KEkea2cUFcrWCPn8L4otZgkypjhep5
	s27BnNOCOPgOSCr/IdZsVsK3EsMGbUtaUlOP0oDO2d9EYDbadl4mhyuDoDD37AxYgQeLCqnpQQl
	xi2kuxZEHYe5Z84DiP7eL5BE4Y79yxBib808uKh8yqzJMbvaxG47SUiljzpVJ4c5cjDZbjTa5kd
	RUEfOL0qYQVRooiY3gJp+yuAh+/GLrcxqt3hAUXqEUziafp0+FDCi2wbc
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr12257701c88.17.1792450573756;
        Mon, 19 Oct 2026 15:56:13 -0700 (PDT)
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr12257661c88.17.1792450573198;
        Mon, 19 Oct 2026 15:56:13 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm35737062c88.4.2026.10.19.15.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 15:56:12 -0700 (PDT)
Message-ID: <bc790885-bb5b-4dca-b5f7-5c338b809f21@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:56:11 -0700
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
Subject: Re: [PATCH 0/2] media: qcom: camss: track PHY type and scale link
 frequency for C-PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
 <31bec5eb-97e0-4667-ab6e-0de662f97633@oss.qualcomm.com>
 <26e2a1cb-d792-4ca2-8530-865ebb887eb7@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <26e2a1cb-d792-4ca2-8530-865ebb887eb7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BZZuL4wk_pq1cIg5X1i2PhmS-0VNFrJ0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MSBTYWx0ZWRfXxG31lEYF13NM
 q5PNdl68XNRpbq4fkTgjJINuHjRbIEXtbLhXjAyPEfovIewMawsfhpn/F9nL/uJ++HcGMMHWf1L
 LZstABAGVDfXm5dXzVlo9uqPsaC2M28=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MSBTYWx0ZWRfX1BoCwbLkMztf
 6+ER9Xcu88pDFU30O58ta9ZcWUDf03ApNma8V1vrs/iufhzJPbTWDIskQ7pwZyEYCWmVrlNPi7n
 3MfwLmciQiH+6LTG6FwLgXaXK+hrNDXmLRwxWeYBOf4G0eVCq/udAxNy9FZ+4n6EVIof5oXrs+H
 pI7UzxrxIb0+BW3Lg+Blrl9Reu9J0Zba5RH3Jnm6uR62/HzaC/8rLiJLx+LVk3hUEisLaCSL+ts
 /xuQQptqj4eqyqbm6FFcIOlt73Clxjm9h7pCah/guMvJRdmCNS9gIOGIBYKKuwxhvRLkM7nfNii
 5EVeAqwON4jJyPqMb10Io5wt1tZYkjHDD8SrxUNuVNvpBzLhNnX67Eamyehbi9SJtvKduECpI+V
 rOqMmLvl7KjxJu+cOLlG2E4vekKQmIU+UTpnD2l6imfyH/KIuU0/kovnY6HpWjF9F2fsTpY3Mwq
 JBmZCRe4qbnzun8ZHqA==
X-Authority-Analysis: v=2.4 cv=aqsnmiZV c=1 sm=1 tr=0 ts=6ad6a00e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HsCFRf_u7LXHOK7ic58A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: BZZuL4wk_pq1cIg5X1i2PhmS-0VNFrJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190091

Hi Nihal, Krzyszto,

You're right. The driver itself does not depend on the DTS. Apologies
for the confusion.

The Depends-on was included purely for testing purposes. During
validation on sa8775p, qcs8300, and sc7280, we needed the corresponding
DTSI changes to instantiate the C-PHY consumer nodes so the driver could
probe and be exercised on real hardware. Without those device-tree
nodes, the driver simply wouldn't bind on those platforms in our test
environments.

Since this is a C-PHY consumer driver, the DTS patches are what enable
the PHY nodes that the driver attaches to. They are a prerequisite for
functional testing, not for compilation or correctness of the driver
code itself. The driver is self-contained and will build and function
correctly independent of those DTS changes.

I will drop the Depends-on from the next revision.

Apologies for the noise.

Thanks, Anusha

On 10/17/2026 10:35 AM, Krzysztof Kozlowski wrote:
> On 17/10/2026 19:30, Nihal Kumar Gupta wrote:
>>
>>
>> On 17-10-2026 09:22, Anusha Arun Nandi wrote:
>>> Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/
>>
>> This Depends-on is in the wrong series. 
>> The driver should not depend on the DTS.
> 
> Good point. If dependency is true, then this patchset is just broken.
> 
> Best regards,
> Krzysztof

