Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677650;
	b=HagFyQCGUMlwc+9ycIsbbrammKiiyoPbVyH5k5WONmhu3mb6HcdOAHpT9x92RxdPOURY
	 Z0dNWAtQEoOwCfQTwjAfhqCVEKj7H+2FJx+Ao/68bkZTKEow8JcaLTOIhKGZfqNljWswt
	 A10Z7hrjLk5mahgONDVSD7omZkI4wCb075ZvQ0tHfMtLddk82fjrzDjbUANSDxONFycxh
	 MdDnw1A4k769xBmS5w8nipiB8orIO50mMrWnY0iea5vUVSmkYaZ7vGVspMtOkZbwq/9PX
	 WS/En2lZ7eCrpgyYay/CX6T7gCjpWo96n4eFEcW6oqVzyN5+2Zj1mvLFMYt8xQOVkhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B8lOtp1BdpmGa0OILsXSUegZLR5YKdtZyQNfiWMkzLM=;
	b=HxNB3rf7F9I9XxDKS3TLIVbi1Wz/JIrkwlcHfnkwGxMcu/S2JuZVdHRWuhE/ChV2WjkA
	 MI3iSNyxyS6ujz9VwEkaJH0F8derXmwzyi68kOhXUJ9rypoE+TopmPD7rVsDhGvWsqWLH
	 vwvqWRX2eu3vluomxV/PR02EOUXelFZ1Yu/4KspM6/2M4XIxkTzgGJN6ICEFvIlWK0ndq
	 0H7GVq6XYqnj4wSmENIj6qP94P8rF9G0LWPJDswd9IMOfXXgWYjS2mar4PsKfA58yTsZK
	 pUAxaWoxRZwEIjgPbLYpsO06LxPZ5wTivZHGffeyyVOpubQpgqK83HNHhVCRVdq0QAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ktFS6dZf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RS0QiWUe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B39606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B39606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ktFS6dZf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RS0QiWUe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AuPQ2594836
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8lOtp1BdpmGa0OILsXSUegZLR5YKdtZyQNfiWMkzLM=; b=ktFS6dZfEQRV8iwD
	pCPK2b5ReA0KEaeK4PirTy4H13Rjn43NnL/7NrfBqS+Ukka9pRyzSmCsUU4yuKrz
	m+OPOLhT2JuVM/KyoTxnZsLEYZ0aS1XBeSB0sLH749jiKiuCJVZKIC+5ETzHMq7U
	01AH4eoTlCgnfOXE1UaI+OcNuwruZhKt+tTHfC43oWuJ8r0ZsKwvHYVopDrVeeJR
	zow6GtiCeqa3m0UQF2JfcD7ZutUxliX1YzBKVzAGot0gPN8mHJvpfMs6jbcwcNUr
	0uC2QEuARqf6KYipyIkVMxVcPIO9mZojyGKcQPdIkiG/qTjEoKNBv4lOVwQCNbnB
	tS1L/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s9xgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:20:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso1237923785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677648; x=1796282448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8lOtp1BdpmGa0OILsXSUegZLR5YKdtZyQNfiWMkzLM=;
        b=RS0QiWUelppbMgyNiij49gbeQMNxmD+A75f7rmUoUmx/DVhKBZzcwB6swFOuVQhNlv
         SfgxYY84QcT2ujMZMJfoLMfb/aPahyydPUzZWo8r69ZOjLvpACEtvM0D/YwksqxTsjjg
         Befz4CtDWN7o62lfdotsHoB/MqIXpFdcglVSaXdPkxaduuIj/gqlFyOm4z9sVymz99gb
         YNZwdWwpAiarYttVYVjz1CapnFmTJkB6uB469Ad0RmxMwUypn63tzrXSwDMjZX4shdSn
         960lw9fJYM6Ls7D58CzW89D0dULlPTjthZVZ+x9wjoXh5f/EzyZK427MO3psqy+7YjZG
         B/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677648; x=1796282448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8lOtp1BdpmGa0OILsXSUegZLR5YKdtZyQNfiWMkzLM=;
        b=yx6fPuNRGXcTA0QNeYkKkpGkkWFGzCo3HcDg+1ajT6PCt5ZjVVmDoi/ac2/FYdFDrA
         F4M22sWBcRyhixyCcavc9YRIm3+IuXGJeQdBroJTM/33lRfu13ecKHo8W0yH18UXHsE8
         wmEWIYqppRNQOIAWL5kUltaGZDHekweI1mDwNFWymuz6+yW42GBuZr5ndkdHzAzlYpta
         r/hguA7/PrzLAaIz22d6cbz4YRcWvyUz8nZKDMwHYyPPkWfk0v1JR+20+xsyeCDB5jnH
         nSyAX917Q/LxCv1YeOTib3Jf/5Rj+BlpSaV1fTp6Y3xpi+ra53xWGkbNK2EI7P7TSoEZ
         MLsw==
X-Forwarded-Encrypted: i=1; AL+hErE0EzZ3xveS3opTyCUOAMrB42Q4gZjwbLH67ET2JZij3PnY9EzRZa6KR7srgaz7k+eKgxGc6V2aDwbF+VQT@vger.kernel.org
X-Gm-Message-State: APuU4Z8DdJeCo4o8cbYq0Biuro/uzkOoifrZXXQydYqvsJYnXuTGRxMX
	AoAph8q9Ptuw7yyI9XTue22wzzmDApr8+KyYrWQUMtUJYmw6rbIrCJl8NDVlkAFRZ2JxZn6LLLR
	enxHd3qL7N9maK9hoFkfg6dHMXI9NguuloUouEfo31uycWMjdJO0wsgmi4mMylXV9HC0n
X-Gm-Gg: AZFdTZfw56U5Z8hv7L59NtOj0/IOE9S4MApQw/75Qn2OkaL/7SGga4ism0EHCJ2gCx1
	5KWWNacyCpNlVc2Pwl1JfF4T0FEF4tcHkNg5fTOPyJCRHwBVZylt0Yq1di5yp6h8ld/wBU2c6I3
	fiIgCc6H43txbQ6qk2WIheXkJn2ZZf9p+oGCp9pTFr2u8zFYd0AUlyM6T0wzM9TWnvvoN0f5YNU
	wf3/bv+qnOL5ZOdnPT7zME8L95zH9NDl7G4gZCNBEgYUr23OJuRZEFbyXntgnAGwEorAAypRw4p
	KrXW/pL5m/wLrSEm2UtnVBKC2ZwJYSe+q3k6aohkRo4vOCeGp0a4jxsIVZ0tDKMfhlDcFaS2be4
	uVqFwxShCDpWa6k9jHhPijDJhA8pUYopNazYvfhb6/sORMuXJLhDKAU8SQt+uLQ+EeIt7IWn/SE
	J7AukAccaVekHojA==
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3781890785a.36.1795677648102;
        Wed, 25 Nov 2026 23:20:48 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3781888585a.36.1795677647635;
        Wed, 25 Nov 2026 23:20:47 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1072165065e9.4.2026.11.25.23.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:20:46 -0800 (PST)
Message-ID: <c23eaaea-9e18-467a-a6ae-d0f7fe6a0b76@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:20:45 +0200
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
Subject: Re: [PATCH v2 0/12] media: qcom: camss: add V4L2 subdev streams API
 support
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ravi@ebytelogic.com
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261126060317.3696384-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261126060317.3696384-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07ddd1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ZovgdgjKAAAA:8 a=3CJxYAzqzxzRwvciriIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-GUID: R3rGUcCBviiQP3mry-D7IOX0wmQnIuJx
X-Proofpoint-ORIG-GUID: R3rGUcCBviiQP3mry-D7IOX0wmQnIuJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOCBTYWx0ZWRfXxctNa+/3AkBX
 OXTYmwYg+5seUp4BpuZzF2lMKad/NcoTuhIqbRbNsRxdFAK/cOPWZNiiwYb9lp5e40g1OOqufjM
 E6s+wN4zXa7+mSBSqPxkR6IGZIGL9Gc+X6yVk8Oc1t/UV/GT3mIZQzkFsxRkSYv5pcpY4VW5jF1
 Udftnilv+EZ5UE2fY+GbMDSMPMF+axfNuraj0tDsMvmVeP8tZNUpWyCxAuUmO19TYxfJmmYY7MS
 8H6DxrPo0rdyCYOP89XQcdRFKOIROY8JiFwR2QnfdlUNo+/aRShw6BWNuo69cJPj8jYOm4Uf4nP
 x5lHtQP9/DBq0lNvRy3QHhk+FDpw9UW8NqEdWcIUpYIkWExQss3dO15NCHHnfJTUm/uhiKSl0g7
 yIAj/7gRHOBeHRsnk7ahEk9jelyaUxGHlExBNAeLdyVq6DAgvhG6CRFi/FLuRD8jxFjJ7sZ9DB3
 F9mAbbhbw43LyRycwsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOCBTYWx0ZWRfX8E66LVgTxRsm
 cvzinD44F4zQC49oowhR8CiG4cdQKSJZYzMJ8Xp/0aVGe5Wib9oI1BF2e5bnguS6BH4GA6xkmjE
 FU3pktPnj2NT0lyhFOrkRbv8lxtmKZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260028

Hi Hitesh,

On 11/26/2026 8:03 AM, Hitesh Patel wrote:
> Hi Gjorgji,
> 
> Thanks for folding in the SC7280 patch.
> 
> Ran this on SC7280 with two GMSL2 cameras, so real sensors rather than the
> TPG. All twelve applied with plain git apply, built without errors.
> 
> Tested-by: Hitesh Patel <hitesh@ebytelogic.com>
> 
> RB3 Gen 2 core kit, QCS6490, MAX9296A with two MAX9295A serializers.
> qcom-next at v7.4-rc3 (7.4.0-rc3-01389-g1843874b4356), your frame sync
> dependency plus patches 1 and 2 of Bryan's routing series underneath. Two
> local camss fixes on top that aren't upstream yet - link frequency from
> the CSI-2 transmitter, and the source to CSIPHY link made per endpoint -
> I'll post those on their own.
> 
> One camera per deserializer output:
> 
>   imx900 -> max9296a sink 0, route 0/0->2/0, src pad 2
>          -> csiphy4 -> csid1 -> vfe1_rdi0
>   ar0234 -> max9296a sink 1, route 1/0->3/0, src pad 3
>          -> csiphy3 -> csid0 -> vfe0_rdi0
> 
>   imx900 SRGGB10 2048x1536, 10 frames -> 39321600 bytes
>   ar0234 SGRBG10 1280x960,  10 frames -> 15360000 bytes
> 
> Also narrowed the CSID routing from the default 0/0 to all four source
> pads down to 0/0->2/0 alone; capture moved to RDI1 and streamed fine.
> dmesg clean.
> 
> One stream per output, so nothing here covers two VCs sharing an output.
> 1/12 is gen3 and SC7280 is gen2. No SM8250 or SA8775P board for 10/12 and
> 11/12.
> 
> Saw you'll resend. Send it and I'll re-run the same captures.

Thanks for testing this, RESEND are same patch set just my sender
name/email is fixed.  I dont think you need to run the test again.

~Gjorgji

> 
> Hitesh

