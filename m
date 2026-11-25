Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600687;
	b=WHwwen2utX2TShr2QLJ11X89fxotp9SGNuyz4ZYu1TmAOXC54iNSNlvTPY07Mav9oJOx
	 oPFf76P1yIKFufiEDul84l9Ymfephu576Uo3+xQyo9o3BPlQrTfmzOjCG/J3wKCzPn3lJ
	 mKqlQdykUvgsQNCviSTEl5JkqRWnVUhli5/89qax2s8QaJ/lnxSMCadiz5FStffEIvDRP
	 l4CX1nq2g+Bxrx18tTnhukxvxh6EdtGX0aKnJ9+qeH8gvV1f4H02HnHgDNiNEDytt0uKo
	 GhlTimoKG1i3/sD0UwGHglawJPWqSNxtLQzc/3XDhs+1UYIsuBlXO6zJEPgI6Uq28gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YOwEOQ04bwonMSZcPiNQPCaNKI8p0Mt2Pygdfegwx/s=;
	b=f+PKl/ORhGXZGi/qt9UEv9hYO9b8Ffr7BQvw7cU3AwfzxaUjDcAj25lh3EfRRUxBw496
	 7P58GzmIAUKvJamiNiqd4SnzEZeMyrN1JimCbOP5P3tgUiyCctgdjHW9SH0UnJURQmEKW
	 kqRBMDIpQS6U8mI3yDUpjWV4AHSUJVmOqEVRaHKxDZIsLqHmGY7O3hnu2Ea10heIdXJzP
	 zTMeKHuqM05m5w840+pelV/VaYZBFV4rlsqZaeUfLMxqqYcGQgLJRJHJ4M1cmUoEL3VjT
	 VlyzQt9zGSsqOEgCnWrvwzLNVa7x5WjRpoTIJURsUqa+shp7KtKxKqOfEIFeYt+suyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F85xG0TL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6vx9xM+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B03606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B03606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F85xG0TL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S6vx9xM+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTj44034153
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOwEOQ04bwonMSZcPiNQPCaNKI8p0Mt2Pygdfegwx/s=; b=F85xG0TLwj6yUNqG
	ucMEqPshHe/Wxnse+cA56hPVXV2ZDsDuTG9HpYBGrYAByofS1d7eK7SKd8S4VzsY
	PI0aQA+oOb0TV0hcwkCuyCkyqta/jgXE90KjckSJnvmqVJJU+Ll6OeXI4iz5iIZO
	1WpFK2W6gcjn9R7xP8Q/H+UAG3vBuuc7cROS2auRp49Osb60bDPiIqjwEflIZffl
	nonR6bCondLRnRnUtK7dmxy5E85QuZHqct+JOG6CPpmFawXhOJ818ZsL8mP1twGI
	pQK8gcfxJMiIQKmMC9OPr+q4W60GJ0Licw9nxHYbZodIN8573690QWjTPMQeBPF8
	hIMGNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj5q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:58:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949664eec1fso77239585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600685; x=1796205485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOwEOQ04bwonMSZcPiNQPCaNKI8p0Mt2Pygdfegwx/s=;
        b=S6vx9xM+/wr3gATMZO3qs03Ipew2Zi7C3cN3WQBZzmomXeGdYP785MwXQdqJ9PG60R
         6/3LU8/KNhbsuaQ3ZeB+UoJ8Q3vVmAtCJiPayK8cZT1kQNAwCLlBVxd33YqXjMxfhBFg
         Qy64eqWkqdgvXiMMGa0RqBQb+6r8jsAaQ5gFQ+Uurhlqi2CtQDR4vF29oOPGpKM24Do/
         1JjgtuozLLk3BGXikf/9ABGu7NtJC1UbY5iFyTE81iJklGxBxOFfQ7PeAT70TX8qHkDR
         1StQjP8WaTBLMUx3KzeOlXQp4WspjyP2l5QklFvl0WpiMx7XAAAtkNy/t98BmLQfQ0Eb
         igpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600685; x=1796205485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOwEOQ04bwonMSZcPiNQPCaNKI8p0Mt2Pygdfegwx/s=;
        b=nQN1sjo3nbCd4Y7+eOzUPphows25KpFaFVQqW2R9v0pyYS7D1BUowyvlgfX8URch+h
         Vx4UkDeSTPdqRY3dgCjetm0YU+nGN4F5NOW0IBJx41xt8KxxRU0Vo6fsIhdIgbYW4PWO
         qvzYv5BuqCV7f1dzmOplW0DprQzhDrkW6t2EBai56+VSLHBM60qRy7L6ImRVeQXGecRs
         +p4B1+W3UBJaC7+lbUkZghJ1VosIlIehPD+W4D5ScBtkVWMwiE/VRNZRJj0A9JxWu9Dc
         CNxEmT/HWuiZeVQ2e8X3OWw6CO/IzXrRq4qJoL9bG95mZqSmmNTVsGhHYY02iUdrN9sM
         5NSg==
X-Forwarded-Encrypted: i=1; AL+hErEfif2+1JvShSH7T54IM7KSy4THV4M7QfolhmAc72jrbnCqk2ZFYd5RwnxsLKyPZ0OzADMKg92ac0VqM4Js@vger.kernel.org
X-Gm-Message-State: APuU4Z85os79B7MFsYq5fMThdQUrHR3b+T8meJGRJ1zLfYXdheVLn1EU
	Vxb1EYI1Mk8XrIRot3E2tYdEuTwW7/RksZluexLKdGJEqTdWp256UTDu1ijaIXQCTyDghEHG4C6
	4P0kok2LpoLOvFAu2rVdcWXYPFWQc9uG1tPP0tOAOrCl47b1pTV0UI0/BZ11pJspb6oOx
X-Gm-Gg: AZFdTZdK5tinNaVyDIVxari7NUTm9DtFfkIgzW73ib+3/s/c3COMaR4gIbwR58S4DkV
	9Y3vSJCKgfuEr962Im1lAP+aR2nSQ+BH1fP7wmG5qlZvT6ypksnbjgaU7n1DW77Xg1N24+3Tune
	uoYGQcxwZnaT5JYdjioLwovatemHXJFIPd3fXRjl91/prtOnStFNXBlIONPcv4PQbqlQWqzlOw7
	n65hWr7T1tqNsUGpb0AGn5Ul/lfjx8wDRnNor6PxF/Y872U1IpfTQQvGrsfJWYdgag+YMhetIG1
	VifKkytHnX7/+Uxa0moiWwTva5yMXgcAoBGRdSgUVlvrwpuhKnZQA7x8MqBWEZ/72RRbW6sveDJ
	FWfM/OtEK1wMQhtiT/Al+Yz0uVwnmGX8urAcdh3mk8ttKXDjuwgCIxip/b4osxDXm1lDWaHs=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3259758485a.2.1795600685498;
        Wed, 25 Nov 2026 01:58:05 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3259756185a.2.1795600685098;
        Wed, 25 Nov 2026 01:58:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm598736166b.13.2026.11.25.01.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:58:04 -0800 (PST)
Message-ID: <89b5d2e6-b8fb-4f76-aa10-4725c8d0c905@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:58:02 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: maili: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX0sl7WQnrvf3w
 FnhrSgMtmndsARiKk49WJ3Yppp1MKUVN99MJ4q3HLIZPk6Bxm8zwhCLOXSAGXWFeIxgRKdH3t6s
 LYTFlTbLVGcHjhquKGmat3FvpSXHYog=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b12e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7uvYGeanNWfiNNmTFgYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX4ZP+9hfcUvSn
 pxMmfzImEWtvSRedrWDIaN6gZW2qCwp1siyH1zeVI9xQb1da5J4yQn8KjgpjjUiQGDi0SIJPktd
 Go4S06Gf/i5zjHv12wLNIjSi4oT2JSyukRySLKw2XWXtbNWI6LR6xLrjuLSN4g6Jx/1ByiEJdQ+
 JByXu/N3kd3alVJ/dLDWy2qpCVsMMWTErs4WwYroBUBZl+MhakaUqQhtA6pfhvC/xm2L7TI0/XV
 V682KoHOcAfXsJaxxva0CbnYLK/31c06+oYrY5RIVIfjACen9/qruRnCYGpbTbsuOysBHXGxRfM
 eI02Bq638DRXr5eSVqXPQ0ZlhcuvIbj9gVzW7Ni4dP3SJsOjGlIBnIuby5AZc88+9poOD1cB+mh
 qTQPArjdq0mWfzzXXQsYx54q7jHkzJJk0X+PYNvJkaCtcOn7r1ZBr9362hpb0vgyBfVqdvDX2I+
 nCvrW1RoNJ3HbqWc0Tw==
X-Proofpoint-ORIG-GUID: OvHDuoo0q5tHHF6tZuH6Z8wQlIli9rn5
X-Proofpoint-GUID: OvHDuoo0q5tHHF6tZuH6Z8wQlIli9rn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/23/26 6:43 AM, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
