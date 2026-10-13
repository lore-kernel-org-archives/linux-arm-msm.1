Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54D50C2B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902764; cv=none; b=G2DlA+nUXpYvsUYc7mD2989hq+fHbVBn0dFSIbK1uPXR8q2RF+wIzQdSktL6NNjwDA/rfA8onIwVHLuLgwm5b1FcvCAC6KqCittaUCuSO1/1umVkxdaEbRkFjPktZxqfHssHq7iPE9/54Z3LEOCeEFLim/tlpadqUBpN3ZFcNUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902764; c=relaxed/simple;
	bh=b82reGu2AP2bjGYbUSB+ai56EpBHIBMVUFBj20u6v30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1a7yuZnUzN/8TAQaKCocYPgVzgROJ0s4j42CoHo6ElUEIhQG0Anctfp3zqZaPpyU5WX9ne6hjqwEDXNN1hhJLB/CJwiQRauI6ma/pMX6rUK2C3lbd/pdS9KK0K6TMtjGhNZK3xasNSOQganyLma3Nw2g2P91Sp3gRn/0JEbo7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O02yuiVP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7hSSCBZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O02yuiVP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7hSSCBZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4RoX2571193
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=; b=O02yuiVPwVbyBdDk
	kayRSH1KJGh2/Lw/04Fd1vOqanm3enwjMb9555js4z5ayt7p6ky4FEUIDYK1/wha
	dxYwGADBLhJtPjGXEK4eU8VkzkzH4GwFI5jGZcJwp9ITirg5mUttAb3+dvNpAYGm
	f3SdcZv3+l3K2SEAZYdxhYjf7Q03eptRvPsiaWNNRygYHhviODnbkySN/mCfY53j
	4UcftGTUIWRqgflstXyocwZHhFvWFrmje8V7Ubct2IXD18b3Jn3jP/Mk/p88eQOy
	9cjEfMQgb9gd1jTayQIAcQEALnfHkwgDMTU43QYiG1DiXTb9frFcOuyY/n5vC7zV
	UfR+Tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcbgfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:46:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso23692985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902761; x=1792507561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=;
        b=O7hSSCBZR0l+Y3zynGRkVmwcqCFYr3uLltDr4mDHIEPe6icooSp+JfcdgSdbHFkFkB
         7r5ijOW6K9ChSFsc02gaZotEwV7v0Spe0qPES2pHpANj/0kHgyYAmjaBhq4GVVdqN7G9
         PULkLCCPLV66HxSi7HgerDLZbMM4tHqRIJUCkLJK1+xweN3EgsuBNKGW33O12Eu5Ji6C
         0U/lvkA4XNoR//vMd3MBEC1RyF+YXMQofVFGhr2QPT6lNCCo5yyEp2YW/CipootMMMlJ
         1kErKqNg/+WKpyD8xcvX2oLtwE8Sct28sDScuzdRWxjaAOTg3l026EQ17jNQ33CxHbL3
         SY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902761; x=1792507561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=;
        b=s+X9P0gYTlP6OFqCdziK6MT82ushEt7MAq7eoIvSbWIH6vk00GzPCT1rQgIl0DH6fs
         YdtfTy20ysQ4/wfNoiaJKeVErKIIF+3xCQMWkW/BSEvOq9r2X2aloCkbeys6FxfgAz8t
         /5p2J7SRuAHFLVxTUFck6fKS9XAVKdv+Pd31YbBMH6ievJOXEPom1JPpmDczN6uNVR5g
         CT6+2msCk4PZeuLENaLz0oJU+/0gtwmdf4dEe9cit6pbT53q4rW0+R7X5vzZPg39rW+x
         GZSetVyZbXgjpEW/3Qq4s3Q293D4nn/phPzDxEjoibzXNDTUpqaqJIJ4HLmjtrc+xxzi
         V/VQ==
X-Gm-Message-State: AFq9FYK6j7mTDtT7CRp7AzxZhjL9dv//cD1bK/+c5KdrYBaR7poC0u87
	uNqkOzRDC4KkbMnV5S7XwB75nyCSv3k9UfUDm8KWoAGj2Z60C6dml7EeYW41pxUGWouWWXoVLCa
	ctme23SmXozTRUQtUB0fog8Bo/jbvrEGzEvfDBPUJKSp+c1vxyO32QAIO1FH33Pse0oyx
X-Gm-Gg: AYBFou2MAK8tHeGHFeBICiOEL/ZhUvYGFWP+LetwFSFHpawHe5CJPu5BaIII3zJlrbg
	xzfIKrD4SfKDMkk38JY8cjtDYa9rv4HoxLfJ5uUGa/5H/fImfH77/S3dXYUqSsOK59r39xhBfGi
	VUm0jAl1JIdZTyvmFfiOBR1DkVLbu+uUfbRCKvuaNw37+Ohbdix6x7PK98Zl2erN+MQ4gTY2NHz
	nlz+hq2q8DicatdvbdNEo6fsHkM6SaEibf/QCji+9UbpZUvS97+5EMFt1/UJmLLL0Q7xueh0nga
	So9I3katgNnUHQ7rNkxNDn7S2aGQAG0yFKKHW07Ke2PiHnyf3/9GgV1p/ITbdvVsqHSolnBjzyU
	HMS8OHshfK6aDqfUO4rYCYA==
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr2356775985a.1.1791902761110;
        Tue, 13 Oct 2026 07:46:01 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr2356765085a.1.1791902760341;
        Tue, 13 Oct 2026 07:46:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3596566d8bsm202245266b.16.2026.10.13.07.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:45:58 -0700 (PDT)
Message-ID: <612c9163-4b38-4d91-8a5e-9636458145c8@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:45:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX7BxtCcRIZE/l
 KTq1FZZE8w4OoQG9sCwCTSjlGqo5Y8IaT7EE9VIsrvSw/OeQZFpKPMJCQfkhg325UmWWI4UdSVx
 d5p8Ymv8QbuawKEcgdg/UK6G6l80h1RbA7Raklzt8vjZ89jiraZHQ35V6mSQQZbwiJ8pFRcsnoG
 ugxjJiVOhpZCFxXgVtYfBWK2WWVLuPTzIKIcZ5a3yKc0NpYHCtZEMqjyrSwGG0t6MnoUI2afJ0T
 6hUE6fzfq2o1Q+O9yShe6drdBrgTQ+gS4nS8jRsbZNH2V8w5tvWenrcQNv4+3aYQHg0j9wsSUKq
 rQY6/SD3mQZ/WJp4BOLuWps9g9QmNcKzxmTpEA4Tbn+bCFTCeQ5s4WMAjpgETJ+zAybyiFRvzAP
 D1SM5tbBt8Hu1CU+CaGu31zVAcFB1Ke+tgZYaRJRZjoefuiVP7YSuVLKq/yZmORIHkuJXNiVZJx
 nF9p/6hoXyiljKU0oYA==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace442a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2XTsMEg2AXb16ItvnVoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6ndM9_P7NGvwF6P9FECzVllyhlKRGCEY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX0Vw2xZuQfqNy
 TzlY4MlWXtyv6AwaCgVLOcjMnZyZg44j77g/f4dn61XopGWeIlSO8pYBQ60ZO1+CqgmQEv0wBzN
 xV1McGvPZ+AqsA47lOzT6MZd8VEp91w=
X-Proofpoint-GUID: 6ndM9_P7NGvwF6P9FECzVllyhlKRGCEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add random generator node for the RNG block present in IPQ5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
