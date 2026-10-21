Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599661;
	b=4Zy+Z/CkX9Gheii0N6tqMLc3ynhaGJ3RkXKk1FSuTD1yfgs1kaXw318u9tCWWYUv3THp
	 ntNY72x0V11anAShF+uucHG33t9W5GFlOI/0TnoEE+Y1YBqsRNft+2MvKUSNRo7pNWJ5G
	 qSCHtt566WvE8QmVE7DYzfjy4vDDnfNSOtOXjcttsKc+S/dYqkhNvKhB3IVLqG22hjM16
	 B9+I9ed3r7KqLbB5tSogYY23x4cr6PLO3+/ArUNaw9ZJdBDnrYk1DUdS06cYCPCAHzaID
	 1Z/k02KCCiwWWB8ue8U/z4/txH8z/X3cIRLPvc5BYgdDeFwh3vWo9HrXQCExjR0AFGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
	b=SEmE4w6+JszVxpA/tTiWr813sAKcX4XRE58MjgyvE11IcP2rw01iiNx3DFL1ecXqfoz6
	 dTyi33afIHcqzvPyfcfkO1cMv6S4gKxfX4B8zWKdpfTf5UFcrKqzWxgmJzjK6yN9+FceI
	 PVhJI8GOmdloqnNIPOZC9FjWUStdkuDFaW9CoZfmgGzhnb0wr31zmUQzA6D3m7hT1fgFt
	 9RwNqO5+pHxA9pnslVEb/A63XtbCZWb8dDtqu60919RgbhW+nt9Ge0sUAEdSbokQszWXn
	 HkoweylWcWsu3IwEKf2fJqahf9msVh3x5xtvrEexJzG4fplsM5h/IX8PSMmnv2Mz4CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFwq3WuU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQmriEFf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB537606AD08
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB537606AD08
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFwq3WuU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQmriEFf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTwHr4158360
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=; b=aFwq3WuUbVXDccU6
	ImyH2DdBjjpi9JffnMykpYkmPPyflDaD7oOAy+hZ3XZAposKZjUgaDlS4XawLN7i
	kkJxvoDaZJ77FNCLX5TBxEpJST6D/nriLtxkUMCw7Tbm9dakplSQls8FNw6r6Dz1
	IC+RoxfII7elux/+iPoegwbE133XoorW+5FY1mDsbiD/eWS254w0t5syY00rrl/2
	ti8Xgs3kk4c7csJoDWLYR+TT8ziKSocv2B2+e7TtULdiZ01BE2WNtAMCU8v2sBpG
	w13+UuRQLb4WTwrf+lovp+Q6t0acYTpILdljrIJTFFOHu54hMeIVTI3l9T7DfqjM
	WOjU8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8td6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:20:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so98883985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599659; x=1793204459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
        b=CQmriEFfeOG70Q/TgOLioizPnkvqo0SoGbNfA7JY6K5LRyEKWEjp6y/UZyi883KLgw
         jYX+wc0GsYjw6EJ1xVo+3ncRGacUo0JhjTmzbOD1kwyUITETL0DDEMKnINQr5ra5Mxad
         wsN5+VaNPuwfGuKDK78te7hb7dqiOzGgyloA5fseLVVxyxYZp/LkK/rTQOBEjLsFYBvy
         HlD0w5KFCd3uu5OOlzpqXFzZJipZmaJVz6rm9+57bFEk67L6Q/nwdbcKYIhDtOQ3BqJK
         PDbGQ4XUO3S4x0jWIkS8h2IbUXEjhNkgql9kEPALDXUdINWwJlyckXskKsKH/vvA/3HW
         O2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599659; x=1793204459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W+k5df5twd/uwIwPEZLuB82lN0JvdHr4jO4Du0Y9TU=;
        b=sTYANhoE2kELojWe62YwcpZknE8okEdGCHcVWS8dsKMuhc+TBLLBnmYxqGfgKerL8I
         nwrmEKBz4LPlZ0bIxWg8MNvDG6wC6MgtnvkQAqdvVnF3DHiDiCB8RMQirsE3pENis7QD
         q3VIXT52Vb073syAGeQA4Wf1jnvh4W1QGUOOK58gMS5wKa8usKFDbzAZu/gDLzPxTNUJ
         bNYGnbV404iPp6zSgK4QwJ1h/gGFDVkiRMgPbKPIcJPaJQtT5baCo8RdtpX8GWFKI9Sn
         ePrj5g4hKf727/tf6SDvVB296qAmYdc1jCGUeRN/0SGMbyfP1R6YQy2r1AtO5bdRigKZ
         +7yQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/X9IUXgRrblHNUYERafKSCG6AePj6H0/WPKAegkl4uw8AfjKfV+DGMdA+Xe3HMqsTX/ut1TB/6DX/WEEa@vger.kernel.org
X-Gm-Message-State: AFq9FYI1jY/aKuzRmLGpI8vVf+2iVAq2KVWfY04kusIQmjP/UNHMypsP
	DJ174TXrr2M/IOMFvkX+sMrEHWmkK+mjXGCl8gltSZmwoGEIB/rZXObVTQjI649BvBSKHMuLavq
	rBP5lPUaE20AF5jdVK04/sw/N5VAysaXJN5a7xYXCO5takn8zkh1sUygCWhruIzZsL4Ff
X-Gm-Gg: AYBFou26Q39OEpepJj4sbj7pskc3Ztp4G6WEipOrLIRPXCwGXPOl4W37rAQA+x0k1iF
	aFVg9GJQTTMHAK6jjS4sZ/0El2GaphLiFT6yuEsxSkfdKRW4MIgANbaXFpymaV6cEm64dTIRnBR
	8BgiAp5NCLWbFk11Sai/qwDWfAb3pbiHk4jY5itgXIp0IEw00ubFlJp2rsM8vo/zbTswbG884yg
	GeVRFurQH4ZYtnchSkUKL5axvtlrll/wwCjLX3/CbkBWaOR40x3aWEraSDfXEKA9hQrDN8yHaQE
	ZRE+Wv/j+DpGiw0EyCN3wUMfFkRhXTM6TA36ckqYCHbQIpsD6iDG6i5gbqnPLNsYo+ervHNhgP9
	6xyXPalYbMds6ZSTlvX12a6sRFPZpYzH05/XCL8Zi0/F8mAbe4RzGHdii+qH/rw==
X-Received: by 2002:a05:620a:269b:b0:93b:bce3:5499 with SMTP id af79cd13be357-93f57ebdd46mr452136985a.6.1792599658527;
        Wed, 21 Oct 2026 09:20:58 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:93b:bce3:5499 with SMTP id af79cd13be357-93f57ebdd46mr452130685a.6.1792599657853;
        Wed, 21 Oct 2026 09:20:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3887:4025:a805:2ac9? ([2a05:6e02:1041:c10:3887:4025:a805:2ac9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm7092835f8f.42.2026.10.21.09.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:20:56 -0700 (PDT)
Message-ID: <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 18:20:55 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
 <ath8tHxHOdA7G-Bx@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ath8tHxHOdA7G-Bx@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX2mjtOe95fEFI
 okvGqDff/S4K4WMnuHMBE80+z5pnAuM3LYNlDU+uuL8lV0KW7VMaBhtsIh3iv05xcw+wuDDDnBu
 h1Ef3RC2TYaPHQ5YqTDf4JDSujTKsjU=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8e66b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=OaStsYZM47bEMq8ebD0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: VE5ycvrccWI9KhYLlP0yh18KCzorOa68
X-Proofpoint-ORIG-GUID: VE5ycvrccWI9KhYLlP0yh18KCzorOa68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX7w6N0+rGJFRM
 2xR7+hfNFeIIjGk1nhiLMiCbhpngxfaKCe1lyj70DZAs/p0DkBqJ0LDwNnu8lyh5cXinwiaSOXw
 0PzLElseOhrtCFcLCDqZSh+oP39LCzLVxDWH45PS8yUg/CtELAKKimHY7GDDxDAhuqZeH8+uFqz
 +9t0g8+U1SYB6w2Ivtffj5poUn8pgbo9R+o8jXZVNGztr/ahp65jrV7vieQG/jbZWzgkTEuqloj
 yjsgmuasuxg3M18/affrrDYL9nz/WhNyXIJJMqDrG9v/vqRRYlooe54/5L56dNxsfRVKpN2UAkE
 BUL9GWoByBKOZ3CEd1mKS1R7NX5IL86h6qETUI0hgtfjaAeuDvoCl0pHFzXLptw/faNekwPnci/
 BiHUKno/fkytCD9EigzroZMubqYh8b+PrsGgKGNCMJM1onchHvhpOwxIV4u/xtHbZVeESK/agX1
 xALOeNp0uLJKIVJkuwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210065

On 10/21/26 10:49, Stephan Gerhold wrote:
> On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
>>
>> Thanks Stephan for the additional information, that's very helpful.
>>
>> We currently have an urgent thermal issue on this platform, and getting this
>> thermal mitigation upstream is important to prevent overheating under
>> sustained workloads.
>>
>> Would it be acceptable to address the sensor naming and description
>> improvements in a follow-up patch, so that we can get the thermal protection
>> in place first?
>>
>> Of course, if any of these changes are critical for the correctness of the
>> thermal mitigation, we should address them now.
>>
> 
> I have no intention to delay this patch. In fact, since I'm using the
> latest unmodified stable kernel on my T14s, I'm also suffering from
> these thermal issues. :-)
> 
> On the other hand, we are at the beginning of the merge window and Bjorn
> is unlikely to queue patches until that ends. The changes that
> I suggested are purely cosmetic (the names of the thermal zones), there
> is no need to repeat the thermal validation. The throttling behavior
> will be identical no matter which name is used for the thermal zones.
> 
> IMO we should use the remaining time until the merge window ends to
> correct the naming to avoid any confusion for people reading the patch
> once it lands.

Ok, fair enough

I propose the following names for the thermal zone:

  dram-board-thermal
  gpu-board-thermal
  fan-board-thermal
  wwan-board-thermal
  chg-board-thermal
  cpu-board-thermal
  typec-board-thermal

so we can capture with the name the ones related to the non-on-die sensors

Sounds good ?
