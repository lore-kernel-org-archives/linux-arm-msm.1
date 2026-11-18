Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990040;
	b=KFbwcaYfTPFMW2Pv5xnyVDnFoWGF9fVlvPc9ayfRxvujGFmLhZHxg7WU0AR2oqvysts+
	 ln9nbE2+bjHq1q9ZXvWzwyEbvXQDFwZNlHE2Aafwf1EN/3UPf8jo8XQe5L2ekPQZagW/7
	 8vMpTU676YEtksvx3pUN74Z6lsEm9qUPHBTceOsFTUQ4AoS3HIkx6QpGBwkpB+gs6weBo
	 +DNAasGhrsHkRAN96vEpYXCZCD0a6Ppd5t/4lZWdr2Em3860VdMCCDH0GYFIam7FnEEu8
	 SmI8OU0xCcYS4IkEtqdDUoX2G0342xHPeLzrHglNwSijx43ciTWtqrBjRtVtbccanPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QkVY5AHVK18FZcn1ra/vmEzvx5ZMyaYWFnvweY5o15g=;
	b=LboDDG/DKcIbuwKLJ6917bxpEhP3sMkoiCJICLkRr6mppiDmQc0hZUfLo+1ADvh+F3SI
	 NXfQqClOwOWc89Ydqgs9YjgQjt7XJR62WNJyufO//ET5eB06XgBRvJC2BSs4A3fA8uorf
	 MySoFiPdSlB1KNvghcKaRgbNsweoDeD1MxKN6AOZ7ry5Zlo6O4c9/gwjnjkFaQqG165t7
	 /ZMrbBt5/+1IHgQoSejCMIPBpO8B1whf3tGjFL0P6iMPyYWuSOYnmVpmljcxecZTtJiBf
	 B8OlXSBktxLQiu/9Gler/Ih6edzJ+Ky3s2WBc2vz523+Bu04fXPYhB/dxt88bFAxV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XV/LeNew";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZkmLnYVW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A008606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A008606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XV/LeNew;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZkmLnYVW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwL72602462
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkVY5AHVK18FZcn1ra/vmEzvx5ZMyaYWFnvweY5o15g=; b=XV/LeNewwfUEG97k
	yldzCY5BeInVpnb//uYe7BSxPYCoUq/Ml61abvB39O6M8yeosUHXKNb1EnHduRqx
	cSM7zz+89FalgFEbyp0C3J+TfAHoGVK4Nj+NzcgzKbPgVogVX71fpUAkDyAVibSK
	yAhjdjMOVMzwQYv0BIMxQOkS5aLfSirpKUMkUwFmfE50MF8d9asypIXMuuLPA7I9
	VDHHUYh/meL90Mvpy6wVjpgk/iCvWCy+PETaneKlSWlwTnFn2Ygl8PsU8/ff241a
	sqRtdwshfqTlPpFAmGi3YbjMoP0psCxqEJJkUR1C6C+mMylggGp/9uSEjEPHAbmn
	nP1dIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv72227-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:20:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso469606a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794990038; x=1795594838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkVY5AHVK18FZcn1ra/vmEzvx5ZMyaYWFnvweY5o15g=;
        b=ZkmLnYVWNFOVA9ITI+PkiKDIlG6UD0+MwNW9UOb0Ni8D6XwPFTbFealcIt740d/+23
         iNgXwV8Zd+K7esfT3sKTH58S+Wo1nWvq4O5dYBYnF6rTA/e+oSZMLsvl3pSGsM/+w9fI
         EQSqnQN6OSy2QGO+w1J/tWQSSYrtUdesksxAZ0Jd2fb0ofHl//kvD82xxtXK6TLuEbi1
         XNb4deLOrisvF04qWnmr2quZYSUQ64puoh7gYcDXiH2witRxPUmV+JlDNNvHBJL6itR7
         Uki6VDJJuCPCZIHbS9WoJG4YOWbzwxPxbZVCIZDHrDOznsbt2OBperlmGgIU3vFhaYkk
         fr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990038; x=1795594838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkVY5AHVK18FZcn1ra/vmEzvx5ZMyaYWFnvweY5o15g=;
        b=KjrjO/WFZy32CEA8Ix/2bEcQm7JP6BgeOSINaBSc/wrm2ipJNIn1FqWlCLpccgv/4H
         9xLtR7v5Mru0cZqM6kP++iq2QeAHFQHn1PZnCOQixCPuDi79o94wOn7qog84QjwKaBpQ
         3WXWY9lbSBLBdphQCBG7UmsxMZCrzeldc/rPpVd6jNdukM7+Rvrt7guTYzdynfFjOQOd
         UNSHcd/+1hBGOik7wUPiVfU1KIPhubrRrJ4kLNdm9R5pFg1FPOf0/juEoATw/kPuG8vl
         m2J727ToFqQR5fvtjTaoY0mFhYCuncfrr7ydsA8dLE7/dxqMza8iWy0yRpD5hdUojevb
         CNxw==
X-Gm-Message-State: APuU4Z94wESyrtBl9HWzQxvYuUWPS1qgMHnhqvvF4kjGTHGgo/hxVxph
	IfSqLgu4Sz4BX1hdCXcq5452nqAvtxNFpb0XiMXybnK1hIZgUEqlRhOS/w6dPRSBPfTvFZ8NLWU
	0TV/vckCIGHTuQpm4Qf5sDylnV/UXI3OaOhbkshKP/11lUeBasO03Yhr8Rk/L3G/IUWSe
X-Gm-Gg: AZFdTZdMDPPWV4i+2eu526jRqXJw/sKmVDpDJ8MDYnxvY/mG6LLDyANZoaA8DyRK7vw
	/FD9KCRDIVQ+K6DICj5Xuvdm1h97MZy7WWlGcHX3vepARtoJo3IOpPiC5NH3DR1I/SUfnPpNz5v
	SQKeZlN0eX9kpoP/KFyXAWu4tyTgqLEGysPjk6fgGDm0X4MEd8Vj39xjK03sEe4ZEEZzoK7VxC7
	8ZUZs0Jodlu3Ha0TKaoRy2VyD7sRZx2NW1ccuf09DHMVXEa5Gh3yewYDw5CoXmR1/X/zqVS+wZW
	tP589DWrAmIF8xPhRqjlPbyUWgWTqleVd/9eflErATQsPOSYxr0WTqWEI4v6Rps4ozdAx71hWbQ
	g6EF92E5IVT/erihHwfYS/OK6rdO5VhjRaggdomy8BrdGvQmbnae3tqMLC/ttw6LpJzppzuhCgx
	9yhyGtqSQ70ybuBr2+HRShsje3BxImEdm7sK/FcFbJz+oR790snD9mVPULas/FL7X5vypwHyKQO
	P5z
X-Received: by 2002:a17:90b:5643:b0:3b3:a74d:f848 with SMTP id 98e67ed59e1d1-3b3d076335emr1655101a91.15.1794990038064;
        Wed, 18 Nov 2026 00:20:38 -0800 (PST)
X-Received: by 2002:a17:90b:5643:b0:3b3:a74d:f848 with SMTP id 98e67ed59e1d1-3b3d076335emr1655077a91.15.1794990037633;
        Wed, 18 Nov 2026 00:20:37 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac292c53sm8037771a91.7.2026.11.18.00.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 00:20:37 -0800 (PST)
Message-ID: <36bd7e8b-8319-41ca-8d47-eebabc6f02ec@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:50:32 +0530
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
Subject: Re: [PATCH 0/2] Enable ICE for UFS on Qualcomm Glymur
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5qIwoWpf2vFGT5SEk5QqGZ492qKtky1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMyBTYWx0ZWRfX89MbgqMmJWyo
 VVHyc94x7y6qObQWPEYCIYscHHwlBqI+rtS1P1h7Vm4CXxm+MJKFW1Vf9vlAoQoTzLWl3h+QRU9
 FW7FkdoKbPDm+z6OMlcUp1pcmOchscUoS6WT0m9anhvAH93J2/WRQdT9YCtA/0klEhQuvhKec3P
 hK4Wf/cK8JsLOWvzT5nww6ETI6NpFgNy341RPEjql+izd4ODdkrjfsljJUBNjfGn1ihTRnmjrKi
 PJyfxF9a0c+gy65Ae9kdUwsTYLIVulUlPBPBbUTLP9GQ5S5HEZ933cm7rSOIp3A8NLvo0qECMAs
 +tpZYYP12VP9EiL9vS18ZkygENkzYv+wTBk2Utx/C9qlc1X4lRZP8N/EwdUvRdZKNw85Y/JHqIP
 huP5pOPC1SDJTzBBLj5nwGVKr1BkNb9rVq0oYOntyIR98GhumeQImvOEM7wUg4iFcRSQs90BQ0l
 NeYJ7IrADkH6V359xCg==
X-Proofpoint-ORIG-GUID: 5qIwoWpf2vFGT5SEk5QqGZ492qKtky1S
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd5fd6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=knTtAJwehH_nPzmuHUMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMyBTYWx0ZWRfX2x2eSrQuImGr
 yNG/YjGEDrral8yQcICqPpK4YXIwqfJWgBcz5YjM+5FpHRU61kfvdYd3gznA3pAjEWwPaT+G6Gh
 CLf3TOKKL4hVkBG5xWjbEeoL46XV6fs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180033



On 11/18/2026 12:30 PM, Wenjia Zhang wrote:
> This series enables the Inline Crypto Engine (ICE) for UFS storage
> on the Qualcomm Glymur platform, including the Glymur QCB board.
> 
> The hardware reports ICE v4.0.3 with Hardware Key Manager (HWKM) v2.
> 
> Patch 1 documents the Glymur ICE compatible string.
> Patch 2 adds the ICE node with its registers, clocks and power domain,
> and connects the UFS host controller to ICE through the qcom,ice phandle.
> 
> Dependencies:
> Patch 2 requires the UFS nodes added by patch 1/3 ("arm64: dts: qcom: glymur: Add UFS nodes")
> from the Glymur UFS support series [1]. Its patch ID is recorded as a prerequisite below.
> Board-level UFS operation also requires the QCB enablement and PHY support from that series.
> 
> Validation:
> - Observed ICE v4.0.3 and HWKM v2 during probe.
> - Standard-key and wrapped-key tests passed
> - checkpatch --strict --no-signoff: no errors, warnings or checks.
> - Targeted ICE DT binding validation passed.
> - Glymur QCB DTB compilation passed.
> 
> Prerequisite:
> [1] https://lore.kernel.org/all/20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com/
> 
Hi Wenjia,

Please drop the prerequisite and dependencies from the cover letter. The 
UFS series is already in linux-next.

Also, I can't apply this series on top of the latest linux-next. Please 
rebase and resend.

Thanks,
Gopikrishna
