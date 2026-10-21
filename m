Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574634;
	b=azuWAEmvO6mCUAAMsH790acFd7ZMzV0hibhVVjnbV5Y3+J9soYB3mh1akaEcnaVLt5oz
	 51KK6WBjQyd2cFrcg5jaKPHu5dgtPKwQJBuSpIrBkSrVE1O11Hy6m2BQ50+4U35hZO/5o
	 Aey+e9AcOen30BtEPaJSjOVOXXVpeQQt3m2pmWfCd4oZ7hRZ6pmzp6XRO1K2wR1mqjdCg
	 XEVsjfDtqILn8EochZ+0MT2QJyBqYZZIxgAb3EtopqxbHnTS3fOhfQS9RL5gEaDywhGu1
	 JZsDmBzloTRU60cP+dIVp4Yw2JILAnd2gjDpSvUkxfbTdrROPcQ5sMDY4ddBVQIoiMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
	b=Xbw7YGezTcu34EokfdHIa8TSgJgxd2h3hsQ6r5Oe++6lT9xpqX6hr4g/fZnNmaHJfnSa
	 5er+tzG6XynTbbOP5hT936ULEr21vpJ+6Wb8LQh3CEICQkfU0oCKk3UXYpEaeP2rprkxb
	 BVBon1XcSqWtf1F5TzHJ0cheKedM0WHyLtPOUkUvJFs9vJhALmkLEyD/EtgFSfRuw75yt
	 ehOMoUeV2YuVR3LZvnVqhcogMFHUWGCLTb4Jdz5fXkxtvpyYq500gQ4RpEWeGlAExDkuz
	 ZecAtkWf7Kx4yKhM76l4xIkdfOOOti60mh8jTOjxUDAcyJlX6GO2ldi36JiiavS7XSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p5GhBL3c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok06dmPK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CDA606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33CDA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p5GhBL3c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok06dmPK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j69f793374
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Ka9h8fsX8IsL44aOy+qAfpa
	60eGKQuL/LRaUzSn1uA=; b=p5GhBL3cgmAIKO6loMAHo2v0SDF8yHtFFu1gZTru
	6RZ8tfjhGZAp7kjI3yFZ7Zx1q/Ca7UBTlcJMVsQRNAWrpAehwfKBhNqjQOEDKvsq
	peUF7q0WmZkVDEinhMbAoNOWdQHnz4BoXYqRH4ZT/496tq1qf3LpTtUioIP4/oro
	RRwpySuxsQQkd5zOUlBJSKfZFtLcrmLPTXYuJZgNxWEPF9km8o+ZlonwLIppNy8I
	nnklXyZQUlepmPou38QjRa7eJtKesLnTqNcRNaqDX5w4zX9Nz8g+bhCdg9PqWvdj
	YrA397AdFZ7l8Yac+4znTMacz83AZ2bGhWie5e8pKnTLIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk8d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:23:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so117435785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574632; x=1793179432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
        b=Ok06dmPKo8V6ebagInItiz/FC2QiTEsZve0yNvMYK9dRc0bj+Tg2rxSppnyfbsr9bE
         NJrjAdENn3Bvjb9ugBXFlzpvvxipnf5i8UctCC86wLGmvxm+jEEq4zOV1iTfouh7XG35
         pipr8AgMr3e9m7clJS3OYNvZ+iM7IS5RGEfObYnXbZaLUDviF8yfXD6/lQM97dmAg4Ti
         PEHgRcsArM485M4kNH52wjP13wBU4MN3KwSjFEW04uk/1E/jKQV/q6SUkxtJcFLfgQwQ
         H13+MMAbYZW8w3PcIfvSNvtwRwwCfXWoJO+cUmISLPsyoYOp3led/M207i1+lNIusunh
         7nNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574632; x=1793179432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
        b=RyavHFXLOJLCEpPbr6d0aH4iRu9Ehdgd4C/ylGpeuUyzcAkvUvWDX63l6UlNaY5mEl
         vHqcIAPW82ocAXBntYWw7tvWl8ZJzC4311vMVgxorOUx6zOKUaIolLiiEXyowLPsXpII
         1T0guZz2aB2v2Z3q6WXg6l1RP1XJ2zCRH9WZpVVWeZuUlS1xNQ0ws9xJ6qUsZ75MMUSc
         UN/UPk6H/UhA9ip8W+qN0a0Fb4qrCofVStSzmhAnBK7pBJskLLfmNI5JAZQfP/+SA0Jq
         vo/BF3M0yoQIrY+Dk3cC9EUhNPHQHHV2E/z8HB6bAWMmr125tCtYkWnGCN58tesIYfV4
         C13Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpozKH8uuLiL4LARThuW79PniKORHDxbQwsLNvLzjLo6oB1wCbicwQ06iTm2Hedbr6jWTpnjNXl4+3utvY@vger.kernel.org
X-Gm-Message-State: AFq9FYJUkr0XJ2WsC5dYU9eCUw+xe/Onz9pixYqiNApld8cqsEHOtmOl
	nDHUvdv+eYoVypeJdIET7ck8amSQ1rSazC/jeUW/+43fkDGej4mPvun0ZECGd2exjm0/76s/zJh
	YalUAftrFEQQJo47JJrmHXzgPBA4p59bA2xyB8fro/bJn/VNX1q8DHTKCfqBpKAR0YMSA
X-Gm-Gg: AYBFou3JHWCWg4OYpG5o9ACUfE2/GgqemesCiLFyeOZjX3XGm2g6Ur9m/ftgxfgO7CS
	lAEO1hlf/ItMU2QpHJV3V/tsFpVwHiYMZV1Vvae4n6SDrMca6PVIJ6aPIKRP80E9l73CJjT5ycX
	LemRbJ/42lHerQy8pw3yZPaT4c7Sarc5A1BViEBXVSn6AN0fLsWV+WcLxSbFVA3eq22EychFiMI
	KI3hv9dpnD7ZpjWD5vsEOYQvuT6XMs55T05UG+t9kAE+FxYqNZZum/DtBAFM5gP5j6vceHj4LHM
	jD3NqpY3pdv75awbPabIyk4OmwDbsrUN7Y4BUuupIn8IUnnxk37zUbDwVHuCBBL3kqtTs72Jaip
	QsXcG+ciLny6CVBEU
X-Received: by 2002:a05:620a:4542:b0:93e:f0b9:505a with SMTP id af79cd13be357-93f57faf951mr311698685a.58.1792574631926;
        Wed, 21 Oct 2026 02:23:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93e:f0b9:505a with SMTP id af79cd13be357-93f57faf951mr311694685a.58.1792574631307;
        Wed, 21 Oct 2026 02:23:51 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eedesm3949754f8f.14.2026.10.21.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:23:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:23:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <cvz5m7jrudw3mhjmmf7aikj4kx4n7ooxjhye4n3u2mwnegsm5j@c5id5su5nd5v>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
 <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
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
In-Reply-To: <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX8UTdCLnyisuF
 WZyYxwea2/ZvaW5BZ4OhRUyd248Ou/AtRBe+kJBGhKIiMzOJWsCDCYIN3kMMbQqNdKKj/Y2ZcZv
 NpGzgNehfy5FI8uhAM39PiW4Chc87YI=
X-Proofpoint-ORIG-GUID: MKiMK1ttzLrwOz8IZrgEMmDcN4cXD9IH
X-Proofpoint-GUID: MKiMK1ttzLrwOz8IZrgEMmDcN4cXD9IH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX3DdPrjk69R5D
 FPTJceKg52FhZVK1mjQD+awhSVuoknUb8BUmK/7bupdzIOOXMSs9oHOLXsBfU2GChW8KscuKnYz
 2FSi5Qmm1QMCRe3pQxMOyNkxolx+NgMdewacEo+0Ji9B37r4mxtJFx8kdcsX0bnAfSAkM6zoEVU
 SkzTR0TKELk71OGizuMj6PRWKekcTAXUYspJ4XzCpGA44dAjU26tmgFTj2NoUzaFUlxGHLXi8Kc
 kWaXFqhTUcXV3twJ8RMHTTS7M76+4GtvqU06NKaukyfM3G82zqeZ4AhGeBrrE+AaSWaNVyr0em7
 T0AcSTmmbj31SBw7DHKCjFlYUh00dn9aWx+z07LSYlpswcQpVJFTq/oPSQpPVLmW4PjmlaJJD77
 mdQU/mv9cfLwnWXNJfEjioQ8xRLBoL0RJ7jQeNG3Gj6DJjaqoScHv29+6cR/gxcWJxIRqMeenbP
 4zWnJ49DQOj3GIkRe5Q==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad884a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=D3NtdokKTziOo_a1GeEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

On 26-10-20 10:40:45, Konrad Dybcio wrote:
> On 10/16/26 1:17 PM, Abel Vesa wrote:
> > Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> > the ADSP remote heap memory region needed by the Audio PD.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> > +			compatible = "shared-dma-pool";
> > +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> 
> -> "0x1 0x00000000" so that 0xffffffff is also a valid addr
> (off-by-one)

Will fix.

> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks,
Abel
