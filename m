Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657292;
	b=I1+AYXM3Z1bgZVBzzzdHVtFrYQEB6o9159s8W89o3fd8Qv6qhiBn4RHF5ACv35TNLZM5
	 PGS39MglB4RnNA40uTBA/iTyKgJg4JbKNFpBnHaDIntabWI7IKnutXRzdbWp/c9BD65vQ
	 2fuS58iqAN4G0LYWFadU6JzS0HfULncm87zN5C2O/Mgf01u5HqVvTMpmxdBOf96LwkLV3
	 JDddC6W7Q/4ywQ1mDEj4nw93Bvzzp4UcMyzqy6dy/mJ6HIjPeYFeBWWMH9UoCXBXVuwqQ
	 P4/ZgE5xxPp9PzfyOKr6MOeb0BIfR+1vzF81XExM3lyflOjTEAZCJMQ50rf+3M+6ZPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
	b=leYtaYSw2WDV/r+8vHx/0pcB41WhhBNUtfx87N92e+QkOTPdE+TFZx4uCgCX5UuvNYp/
	 ynY4wzMxVxmLyEzZlym16Ee+b3vwJjmyxaaAa/xQ0BJC+aSlOzYOiI2op4fG2+ErPQuad
	 FsxjDSgxybafncei1PmSILj5sDw4XfOTNngbNDVG0a9ZtgoUbobXMHDTP9gBfsuKi5Kmp
	 m9AH1nGI6JNi96sIun3f/01b4lIJvPquwB/IQhCd5tGXqJl9XAOj/C8ARAVQkC7Dwax3z
	 oOALBz0EPJLFrxp9KXOctid5qan3YMrrLVBcmhs/hOR2tNv+pa381f0msWOzdikQa6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn5z8E4e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqdbrkDA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE80A606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE80A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn5z8E4e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqdbrkDA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xvLR1560115
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=; b=Kn5z8E4eI7K/JXRs
	FKquDba+8ziR7L+sCHEgY4v+EkWgG+ebGXazLHfA8L3jGRW3/rH76cwVr+0ascoy
	pDePS7cQ2DRtll529OVK/4nKwgUE4BF6bUQlndogx6mKDKRudBG78QlB1KFwKZAa
	huwXVWvBXS0/fywhgFlBDIiG02fc3mdI3TkyG2HisuGw82qtn8/G/otIYNcHW2Ub
	mb9gLzxQP/Y0+hxS3/DTlRV37A9oYhRykTDYo78aZZmb8yh0Y4vDdMwz7NkvFzKe
	lXaPGCvUbsAQyfi0SuDOXmYMCzhxjoLzz7YetXgo3nEHmaVgYSziy/DCUrhSJOcy
	XfngUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahet4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:21:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac58b24so42953985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657285; x=1793262085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
        b=UqdbrkDApGebTTgu5I33bJTgjWVVHZZjyeRFx2QrCixg6NWz9jW6GbTPS90SpKnO1t
         86wkVhhbSgt3gf/Jo7YLHoxX6LQ2b6oYrKM8MdiviE0G3j3ugH0arnZGO20A0M8S9U27
         1RBlvhExrpf7o/ac3zahjzYTxpXFYdOd8BjtICTvXagmJvclq7gDPzAcDH7dwWow/eBw
         iF8+7oLInVs2KA4WdyXyUaS+zyqwsSlbGY8b3v4hqJEaGFchb9v+6EF83ubbyvqFNSi0
         t0rUf93KzOm/fPjnlP3p/twYK0LYnxGbnOsrpG3SZ250mxtPCD7VDSMHCp3pYhSl+r4V
         IvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657285; x=1793262085;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
        b=esM11J7BEosU8j1yz/yLOihrMr0QARxz+0tsUM0pDSwirNffhQA077El+DRkrjRhNG
         iQmUIvDD7r8hbUwesQFx3V1TMddXoEFc6gqmR02NyNXqdJFEC/iOm5G1TBla46o0go33
         nSRk1+npuSSt7hSk/ouATP7AumdeVI5rQAOWFhSraA4Iu19oekUBYCvAqLzfPsqpsVBJ
         j7gwwr4IoD2jf52Nx6kJ66bKg+kxaieXuzQReZNvTWiqw6kq//Rl9JToWhb079hjzSg3
         AlGQKA+XfHL2VmORGnrWxjo4eB9TDVsUQyWker3rbKf1O9c+nCKUT79VK/dncT7GA8wa
         Al8Q==
X-Gm-Message-State: AFq9FYLQ0+XE0sQoEZGIxLuh/xIxJ+Tztwae35ArEohf0bVKfT0qoA1V
	WVikkD6l97faNL2Ee4XlKeZ5sIX5VtQtMrf/G5/Odo6DTkUruZ4LlTpK4Gi7nENG0SwhQ4Vn5KQ
	8RqtFgE7+cGZOoxH9h9Orniflh9NOTQiSIJ1ORt5qUHG/wLqdiN3ZzYYHwwJanEemZDPj
X-Gm-Gg: AYBFou0DJCejGyFugs9NZruEOmMWB5kTEYivfmnuu8FAsOvdTsWDpgssuZk2RWMx5JM
	hC9LMuEfYHnV0+fFIJv4YbYM9jCJm3uKiP0oKElfQ7p723IHgN7NGS5nDLRsPQ4O/mwhka7yT9z
	w0UpmWUmK4RUr23ob3qbZVeZppxuVzBnwERYVaGycdf7+89WYCzE03tQk98Rw9FIgaTIot+5ggK
	NDoSmYvOZBWz6n3I3OmDQYaqK6PJi+kjyi2x776dz2MbZJTbt+zUaxcF5qWfy96wJH0ypNkB6c2
	ihAeFCpBINSn7zOOJI7uGL/PwAJurKWMBIHgcSRUOmSgnjkoVDcAHxBMhKLr28S8pmyb3XY1wtl
	BVV6d6Er0BzOdqJe1ucR/IA==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr910048885a.5.1792657284910;
        Thu, 22 Oct 2026 01:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr910047785a.5.1792657284557;
        Thu, 22 Oct 2026 01:21:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5743bfsm78940566b.44.2026.10.22.01.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:21:23 -0700 (PDT)
Message-ID: <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:21:21 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX9A2JuYG/epv5
 F9nb3jZZ77WbvKr5oDpOiGOshrGp5EmYNlKBK7zZzQMQl0eaIES1bWHJwyN7p699uQa/aVl6Lrf
 F1MsGYy489nbEQBY67tD+Yy5UawliW8geX0ldcKw+5ljIU0bw8Dld5jbQ6oCwmC0GdbkYqunc1t
 ++tiiZqhHa5rXkm5HtglG/nSVkchtJygfguvjT5400+ycYqCusjtkz6tSrTls239wT2p83KTEC0
 BwZwc+v1bD1V6Ovvnq8C7+kmEhzAjEypNNK6d4RQ3xjKefqN5/sveOV7r7URrYj4QUHT7y/lY60
 kQnZoIDZgL+D1cgtklOYeUxYMD6T+o4/x81iOL4I4iWWQ52278rqgCo9qSNTKASIDTyAo6XlRuX
 C+oIoJXX1WUr8qTc3qFdr9/tvH9SzP1taaAVv5kJt5/yqO1bVm5UnTb0yWK7wB4Y2NAGusm6g/j
 1Nn8DWnJhqLqpmoWB4A==
X-Proofpoint-GUID: 9ntVkGw9j1YzY5nDjIfzduIFhy5OmVWr
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9c785 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kYKLuziri_h7pMepM0gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9ntVkGw9j1YzY5nDjIfzduIFhy5OmVWr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX5cTWGaM3JoXM
 5vF33co2VQF+uDf45pDucwuss0yaGDoAzpAOUsOnjqCMdwrbDKDgsZqAXgTBfTDku8sQd5kBlEh
 pIiz/wb2h2Lg88zLwxpw8dWkWTQ0dlw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220033

On 10/21/26 7:28 PM, Krishna Kurapati wrote:
> Both USB controllers on Talos are DMA coherent. Add property indicating
> the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I asked an LLM to find is_rpmh && !dwc3_dma_coherent. It gave me:

- kodiak
- lemans
- monaco
- qdu1000
- sc7180
- sc8180x
- sc8280xp
- sdm670
- sdm845
- sdx75
- sm6350
- sm8150
- sm8250
- sm8350
- sm8450
- talos (fixed by this patch)
- qcom-sdx55
- qcom-sdx65

should we mark all of these coherent?

Konrad
