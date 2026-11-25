Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598016;
	b=CwJHuoMchGv93W9iITyHJgiC43CGKqlw+Prj+3Sehdvv0Rt/KCshXSZ9Xyb5WiNILeCw
	 sR3Ofdf29jZSJAkX0bkcWMJo6LF2is90f32nZ2rjBjdFZhD89eMT9nlT0EQB6dGZooebg
	 b+9MK2ah5qvg2fQYClxlpTTRM9Hds1Bf1sob3iXn2G1fdGbUAuCZSXKQyrobCAB4rAb4Y
	 0Ezr/iPtaWfTAK0odI+fy+ZINnxzhPtqYm+QINqRyiXA7oNsbpx/PDUamEohI58Y/OR+N
	 WLf3lOPFQFPWk+4mIvZ+7sRzDx3wBXr4aArcGUQiC+elEhFtLGgb/knpSJaLLFhLFkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
	b=TcfkFjktckejBAZBPLX4PAMPjdSWW5NYJ+5ElLoG4ZIckuCMN25QMNs4yao/VGqVdQwW
	 pYHY+XLjWsy25fWiZ3b6J8qsSCkJtFYjalgoa+6hizrz1Bjyu7ITQXtpm6Qh4drHTsvEE
	 6El1RP2fYyv7Qr0CmBGUPUMrutuqdJyk/7RT+gEqXWcuPEao9gh5fe+wJY9cMNu7WtlbF
	 jd/+lSd0mgAd6xExMm3/hMRN+p9gdVcK3z0E2A7vlj99ipPu928w1hhQBnRfSCiKoV0Y7
	 +qsRY/74PXMapFsUi3HRhFu3OzXswlKowyaL4e2MnzOc9Lmk1khI7q2RfYkl/MudsEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKbpflYN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIh6NEl9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD0606A682
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABD0606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKbpflYN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIh6NEl9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9Cgrl4048484
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=; b=fKbpflYN2Li6SwsW
	x+0dVOscZ6J/P88HrREvH7MGuODuqPalnXAOpCuBvPZ59ShYGzNDBtRLAOJmjRQV
	53NMD+0JkdIne0+qz6/U4VXo5SlyMzCC0FOTbWMmz8wR21AhwmHk+AdUBGKiFqa9
	pf3+PWllITR6Z/IVb7E30EDoXgrDACWfusmEbECbkjR0l06FRmRoYIHe/cW3tBwv
	/6B0GJDa6W+SoJ0lCYczbd2nrrwJ6BzAdx8wJBiAQJJzsh2jjLu4Ov5Xcso9jhDA
	RoTpwZGAZd7VI0B4qsDJlCS2BkLJNp59fqLsqlTVog/JiyyCSsKqHoxmbIAfb2JW
	fUF1Tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhr0aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:13:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94964828890so69580685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598012; x=1796202812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
        b=EIh6NEl9BDJk2OrN+wNY1uC2Fe7oSAIlvrYTEtxZdFnQdXpp3qdiLRZqumcTyrr2/M
         0gm2aAhoYF867nZbN0wyLYRcUy4vnuCRbkqbj07z8StnFOlB+0Za5jb3tyM8g5Ks1peN
         kbWN7T+R9AwxCecBy/Qq4cdUFYdEykiYuhd8qMFk9vLtnyIFh4vr+soFx5WSmFfy9vu0
         m3dHj9yjJZjJvQ6ZSmf0Y5R/R2TExTXRYSSnfweY+kT9MGik6BSlcnJkiuCCl+NFrobD
         gghoXfOFxW3IYciie6NP8FYbZfaAjOStF/5kThZxzoCksyXFo5Br6EczF1TfG2TjU+fm
         nH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598012; x=1796202812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zz0pHGwefJCrqkhvFa/1jGyqdPSvI5JqWgz77macx9I=;
        b=xe8RjxlnlISwhSucznbA0q0qz1u0amsPRuiNwh76wfrqegDeeBuaP6TFbcgD16ESL/
         k3G0Z4Z4sYwGeu+67D1+QKnqdZzmwzKQ8NUlOF5Iokz/XosZ7fqprsQYwbmT2cxF2+41
         gtp+SoYkS2J9sKFGRDxD0HExYlha/nzAPIkx4nEu4ElJO/oF0ZB+lHRgT7ZSfXE5ZT9D
         7LFiofJMTRqIJs8svWTBclHuFN6v9Y7hE0TqNVyGs6YyUayJaL4FKWWIA6OQBmyx6Eh4
         Ffv3zW/7VZ7TpSqgMl6Pv2um17++YfLhPCxI5+OymNLB7Bj8NXynveqh6AU/9tsvnhUA
         N8JA==
X-Forwarded-Encrypted: i=1; AL+hErHmqwnbaHFyrOBeJ7l0uqJy29Ej8g/qskeevPoPU7zVG7MCsEXZtAhdNrX4+7jprfCaOH+GWrnrIstFLV4Q@vger.kernel.org
X-Gm-Message-State: APuU4Z+rrUvKaG37Hj+tBMBwKCdTAMXH7+ravpC+3bCm8+arlnmfdBPB
	G/VFWxuOUHNh1BD7CKYqFo+FmWIoOL+IrgcTQxsPj5rZKTzi0AlLM3jtBaVhWmpxj6Yfb70je7y
	vaFZ/SGMXChcGx9bufUHgtMQg69AhwKJRLrsokKk7qhAgexCkE69WWkvrqqAM8G5DjHF3
X-Gm-Gg: AZFdTZemeibHePtqPV/7oJ3MOe/N4WSujys6dgh8nMBe7DAjmOlXRQBnb+q91/mgGoP
	8eHf4P9dHvs7rqRPXisR6NH7WKe9wRwkg3L/oM7Xe3RcZaoxfycOagzblhE0sriUjsdWE87F24Q
	ekhGexTl488vEA3JKFns5sVsplfdHEgjvsb2Lq5Km30Udb/kb8H2YluutpZKNCi37beR/lv1zeM
	jW1TF4+JqE/Zh0sWQjJNTN7h248GrIuS4xJNXWPmb5fPswohJF9KFlQ3lIvN4VII1Ro9tU5izNJ
	GMRDta1RNOsoemy0mUcHx54vNaeYxe69BBjzCrSY1CUfRlIoylCMApE/xOqO6PG3gXWnhyXIBt3
	ta3HBdH2vZchNO6kdxw3acIRYn1AvPA0iqVRqVfT5nR0SGG5sYMI+6M8/cTBqqER3bp4WyOc=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2845919485a.6.1795598012588;
        Wed, 25 Nov 2026 01:13:32 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2845917385a.6.1795598012173;
        Wed, 25 Nov 2026 01:13:32 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm7951603a12.27.2026.11.25.01.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:13:31 -0800 (PST)
Message-ID: <25657ef3-3bbc-4d70-bc80-e368eda447bb@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:13:27 +0100
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Sort the TLMM states by pin number
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
 <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06a6bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IcN9rPl5bsQiho1bYRUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: q-uHoAANMVqCl86ZCnlJTAdTeQbedgMF
X-Proofpoint-ORIG-GUID: q-uHoAANMVqCl86ZCnlJTAdTeQbedgMF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX5d4Jh5oR/o3b
 cWC9wKuecnUN1JMvHUMEk6Bo5YLnE537ECgM4xt7zOLBBYN4qJcXuZ5r3xJbgnoOBhfXEIIXmPc
 BFfXXHbSzTKpuctpaQUTBftm1gaUNuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX0MCHooax+Wvw
 +rjclbUf5QTj5EfrZdyNefafb+joA/mCKzXAvzmLxElMb4enehtSlBtc9qZH0fC16ueiKbMqO/d
 KdUANRU/XRfWWXup+N3MO8FEzEJjLW4/Wfbit1xpMWsOKp5iU6aChTxQyj1SPRg8vszICAjSK79
 PeUkRu8RDng47fxqTEVyjb2mV8ZrfniXMJOLz/1bnYFM3zIu609cLHNht63lu+WE8GXysiG0ND8
 ywUBJqq4J2llrTR4PFeMjpVDWgiI0363dOq41WlyttRmL3gAOTkk8JgmhxYjCTaA0zLci2igwZX
 5uwSzheqhZKE1gH5sXfLd0E9XVJdw9qU7l+R+/L9hkk+2MB/zLO/Va+BCL4yYXoKKKjxc/7U2uz
 HI/Gxpye2JaUzXPEByKGycz6T0wdXdoBohhsD1pAiYMmADjU+XDD2FnC8V5lk5+vXDNL2+4XY6q
 nqk5dl+EUAXRV/jNgBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On 11/23/26 10:35 AM, Abel Vesa wrote:
> The TLMM pin states of the T14s Gen 7 are ordered by node name, while
> Qualcomm board files order them by the GPIO they configure. Sort them
> by pin number so that new states have an obvious place to go.
> 
> No functional change.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
