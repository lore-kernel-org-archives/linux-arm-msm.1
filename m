Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798487;
	b=Y1sLG7KWXkibFVJvoIAy+gr6U3SB8FjgVJj03Y4N7U3+S3VkBXxps06i2Hyn7ltJe26d
	 kykDodzv+iE1ohm6kmX6hV+JJ3F5mT6AyTafWwCnHqM7dBvg6b9kOtlN/r/aIFQlUOBmG
	 OJV1RkifRqnjoan2yic87NDm7vGi+STM4mKKQiFucZDbAAxyxiga9k5xc1g1+fXqgEDmx
	 abb6TXVg44xHzuptqNtxNl+QqLOacAlGjkdK1Nr5geMDEngGymtoYd4Xi69Jt/jh7Fl1B
	 SET8xAKYgz0RYAUiSyy41S0TNnBjH5KiRZukapu1GPSGZHWTTwQkFz7+9QnefhOfTTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
	b=Qo/THRze/8oT0w+eUsYj6CXBooEMEFNnqE0BtxrwaEqdW54DbXele1rcgcAsQaNtJf9N
	 aOp6+2gjS0eNbizf8y5F6dlPx+sW9nGehtQn54GE/AHh+SRi3vndasnxhALuuXixJyBJJ
	 cAmfiZUDYwCFICkvcA2g0SitK0IHM9/5q0PVs28s9HBjgKwsCGcS7lQAUklfMxD5ZfA3x
	 t5r+bUIwLGyPBMzvukf+tl/W4IcYKQZyUlHefwZfs77rocYXqWPx3bymSwMIxLVYCwLlJ
	 qCgcjo2TzLH5AiNSQ2kf3j/UpM30TSzxBP6oRsWmymRh1C1YWM+ddj2kMiCy0M0OA/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7mhROGi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7deNfcB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0E606D804
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 13:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F0E606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7mhROGi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7deNfcB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4C1RkI1764253
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 13:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qo4pe7avcSY5Cv2vjrKx5CQZ
	iGftqTo4ZYX8oBfFgQU=; b=R7mhROGiOL6p2MqnlO1Hg6L2M8Ht89mafYPL2Dkl
	f+4hp8rWPFWVDcirAgkzqrJPWVjrvLM6nnIikWuY777x9dd6IIYEBJgy1K7VJleO
	rNalgb6jwpFkReVE4yMSy+rY6KA3qZx9JgkCMbVhi9UrVmZKkAovaapNOu1AGAtW
	SpljDoCPzw5evg7bTF74EO40pgdEUgYfxaC0LJ/kVLt40xX/8D74TcrT0erKhUGc
	Gbj6d3T2lGwZYOKziqXQnsNpJ4L1afRkHtmfNRvFZpO/sRjjabBfBIvbbWu0V19B
	z0tTJKIWZLbAPwiSU9DMdHMnsQDIdnUCfu3M+L4LJY7sdA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn09v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 13:21:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc37ee6562so166155137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798484; x=1794403284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
        b=E7deNfcBj8Y15SbCjrWT7yLZZ4r3IFU6MR61hfVU2NqWbA+i33olNyGP6pcdVno4GW
         Z7Pr2OgTqBMJnDxskNmJ1WnR0bvDAnOE3kcmAc81fIx8aeLJPMzMChNm683r5p7KWwDL
         lmXJ5WmqB38vOCcR08sMUuMCMpGwOkkbeesrpEzopkHhCHP5ZOZy/4tqTjvWmRuonKwZ
         AaGVgfXF6t35mce68HorQ+ld4TjdLfaRZZr+1VFZbghJgcrmCZ8MCRub25KrVchcSU6o
         IBf8qCoEkUuZYn2t5PobChr4xwBwkUYu6zQiSC+p3d2D78Vo36EhSQOt6Ll014tKCKFa
         IpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798484; x=1794403284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
        b=O1Tb6qOYjcsSbrE3EhvB8EnsyfsTc7s3y8maG+n886u0i1Hv15bnwApy7LyoZP3iCx
         8/7ohjXZNnYsuo3CZb70JaPlMfmuW4sXpg0SMNRs7CqWD7sWnhqFkIMVn7Fmt1lC6rSU
         m8VfQTvo/UhcwEojg/jygtrzHlCVfbv0uNbphZPoIwKd5HmPIloUf4FVkoFvV3vtC4nJ
         QNBJl0G8Fl/B3qlXI0aIwdCBY1lytOrAPpiM6WYm5GDVUkUklnukIBpbkxfhzWFdP0po
         IZHVpDmficYbbEA8G3q26S9J6pl6klm0eb6cNMFQYKWXoxxMdeYhIf+/Bd7NY2daawCA
         ou3Q==
X-Forwarded-Encrypted: i=1; AKwUvByByTCdZF8xbGGf9/ooqpkBqJpnWtqtq3mGWIovH6rCx8IHIcdnxV1Dk0ktO4tC4fClXRXOr2WwIb8zmpWP@vger.kernel.org
X-Gm-Message-State: APuU4Z9bfRbXwtoZ6aMn2ES16pWDJAfooszdFhz311PSP7wEp3sTgFDn
	uJLORC1JPpxoTmU8MIggP5dY2Z9qg8UQNitUO1J3JI8DPD/kkelUPbCn4mdnc+39z0goWN7b/uz
	4j61hM2we+EUL8yDHhzSBIFRvhYZcV1gYa3MvDa+eR5WRBAb+nBgwXk2oNNqJ6hPOaJSb
X-Gm-Gg: AYBFou0/NFAAlvya9SXT91ZItJKPCmDG0LrDxkRTBpERiFvB8tpUbsHwzCQ45z8j87j
	RXtpf1HHEk8iDM+C7C9N8MQ3yxrgyeW5KPKbE7dBVw4uF1vjW2RYitsqIyvDkztlpGeOr0z6328
	MJwToTWiARzoyOeU7oAVvmfgfr1ba/MYtLzVcx3XkKOSxyTRyTYh1P0lWlJkRaseyuDxuCitXTJ
	viBVGfTcnBk0VrIpdoGHlEF5qhjWx+KZ838SrxNqule/a2jMjeCFal3IEAr4ROrFuObmLJtt6Q5
	pATFQxcRW71dXD1izhCHMElFiBfe8n+Hi7XcvNnsxMQ7ie8E1oA8PvsdhaPcUfp7ddPlfa9Wmhi
	e6nMCJA4wRJAG325ki8o8mm29qV4sPFzjW0r2mdKm8mxIjKdTGNY6vYWwcqL6prk=
X-Received: by 2002:a05:6102:149c:b0:7cc:9d83:c670 with SMTP id ada2fe7eead31-7d0727380dcmr4847990137.25.1793798484411;
        Wed, 04 Nov 2026 05:21:24 -0800 (PST)
X-Received: by 2002:a05:6102:149c:b0:7cc:9d83:c670 with SMTP id ada2fe7eead31-7d0727380dcmr4847970137.25.1793798483608;
        Wed, 04 Nov 2026 05:21:23 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d2bbsm4151228f8f.33.2026.11.04.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:21:22 -0800 (PST)
Date: Wed, 4 Nov 2026 15:21:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] soc: qcom: apr: Narrow critical section in error
 path of gpr_alloc_port()
Message-ID: <f5iivuswaihysan45izwqpzgnrvxjdvf3qqq7ihw6bcht2xzcu@6fxt4h7hg2b4>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX4cFYh2Ko2Bec
 KbSyKVeOp/V4/ujnUuxJNE6evhyJUDR40QutSRJXFop2ylbi0fJDU1W97EtANj0f6io3zd7vQsT
 EZ/lChikTJK+rXJJbiDPxDFQwtcIb7EWnVPTDUxNS5cZ+w0HPRYUA3xTFyU+2XFme1DnsAHVyoF
 LPymHPXVfVXDOBBknqeKQIgtHnVK+xdwfuZpxK6kfUVE8SYSHk85SGqwsQ7Fzc7O9UiAfRjkzcY
 es0rwRkj3juhtUBFcc8AIz2D9pbslXdkIZ/u/S4e7+SObvSmuBZcZE5XPofnHp2zBOz0S8KxrXI
 bucsrQerrHpNSVrL3eIcVr9wyxcRkziox8HwOBuo87YJTfF6lppLF7L77d5KZmyPcZy2tHqyhWy
 oiTka963HMmwEiC/s5vJOduhOEQ0fcwnqBIinXwJIxomt876AErlQbzh4JiwCNMOD6KwwArlMq8
 cTWklXJWiYoz1tT1/QA==
X-Proofpoint-GUID: 9oaycVs_t4g3aXXXqR_uw-oT3HHGlOTn
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb3155 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hx4PSVFuWk2BDCO8aWAA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX6gUNkNb82eTY
 jepQnbsBLYdwKZLBihVCnFkrVqrD8SRNEDtibi1Fu/BWJkYF6NF91oLIHpUdpOQJ9l28jBonbyT
 WYA1ZYyQn7cGP7n0qrFGuOsKkKornxo=
X-Proofpoint-ORIG-GUID: 9oaycVs_t4g3aXXXqR_uw-oT3HHGlOTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040053

On 26-11-03 15:56:38, Krzysztof Kozlowski wrote:
> Error path of gpr_alloc_port() can unlocok the spinlock earlier, before
> printing error message and freeing the local memory, because the
> allocated memory is not published outside of this context.  Shorter
> critical section makes system more responsive, although gain won't be
> likely because it is only an error path.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
