Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447404;
	b=hEz6D7/latdEGKGx68tdXBMEibjhOgJhiWD0w/GHoFBal5p/+0WOGVWFahf1pipI9e5E
	 nq44J+HlnsmtRByFBycjlDWi0hPYm6obccr9oQrgtRd5LAP1ZccTNXVuccevY4eGiPkCY
	 waydXqU6Wmbn3J6zCzRlP6PBhegLoEw8jKNZcu0uQ+POyKFcAjQcZvzwL7Fedu3lVZ1CY
	 hw1yCCERSoE6qFiKDoHFM06vQcYWs8e9sdZ2U390RH5sWO5XyQ+9FKMKRMAEnBY0hdUQ3
	 LIJTTBx4EaOcTiO1aWmXSU3zH+FTAF1JMexgFxcuSjW5CfttMJkCJrngnMKRpU1IH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CtJ8QPl69xr6qwzO+D9Fc+PEvEQjDTNC11YGmKpdMN0=;
	b=EjUXYB9BG3qKlq+wtxoyJOXayHG/NizbunKVPiPpWArsWYiv75O5pAStIVRH4XKjV9jD
	 051FcpDCqB9SEsctzma3O1caecQnZF9/wNTh1iBZebpoaqschFVqyr/BZqoOPSIFFMpbU
	 7XHtpbinQGcbaHwLE+FAm9+TOeeuQyxDPnEhvOdfW6OBsHz5u4Mk1Nt6bGV9kPKHIoGDa
	 Eu2YcRpydEqTcNKx9bGG1fUsMFhJyhJE1QAV6tZY0f994jPcUOAcTk4EkUopMO+DiHcgv
	 fVjRO/csNb6qjJKS9bMbwM8VVu3TnsiGYbSF628Ub2d1bnKPMEukNd8P3itW6yxkxxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XAwhOH09;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FJ5e9WDU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1EB606A68B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD1EB606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XAwhOH09;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FJ5e9WDU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLUF5446437
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtJ8QPl69xr6qwzO+D9Fc+PEvEQjDTNC11YGmKpdMN0=; b=XAwhOH09cSmZIyMZ
	61SRbvucln4yT5LQR43vwwtqrg6gGUS9OmtV8TkI5NEXkzZ6XQ+aWc6UrT9959jT
	/p2mtQs9rzMgULMUzgs1J3Ky1mD8SjzsEXjSYCZkkpg54W+1dqkicupzXFScFHKV
	378KhdbXjJ3WyA02Z7JKHyyOb9ILPGKHiCmH6y+aHyEghPObUkY05P1hLcTOzEbK
	4rejhDHzbNrQ2xMYOKKDDFiZ4ClrVRZyBi3xcccpDG93Flbmn6FoKTKChPcjcr3a
	pjCWu17C69iKDJecE3z+bMH7BFTHAtHA5zumGQfOolHgWdQIhmRhpSbYk8vUhS2G
	NNzfJQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7421g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:23:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso99538e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447401; x=1796052201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtJ8QPl69xr6qwzO+D9Fc+PEvEQjDTNC11YGmKpdMN0=;
        b=FJ5e9WDUFovDDsHKUhfVgJ8bwoMgKgj7CPVmypMye/O5vfOcpdoiX/My7eToFpl18X
         DW2E4AbdEhRG5UlLvcFT/ODFKTgGiEQLnW1AZh10b9ERQzmTfBE7gO5VJW++iG5QtuKl
         9uXU46tbHGrZG9ChaAmzrY+mvZPYdw0+QEjXIFhzQWBH7InrDxzHJpkxmLghux79SxkN
         3u6KhHOKZjMk1nE3FY+l1zrJeciMZ1bTgF9wb5zdIb2LPCS0di0RBxJJ+vjFA3bj1y3Z
         ejsVyxPDD74u8wxeiyFPXpRKp+lDnfn/hsCcSJxYEbIyseef2OL+Yq1uGpcDPqb6l8vS
         /pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447401; x=1796052201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtJ8QPl69xr6qwzO+D9Fc+PEvEQjDTNC11YGmKpdMN0=;
        b=nAe+B3+TaXnYbxOUXDI2B9PFm9C1OF6covo1JfiekOxOxMSYlnJc12lyeiriROyOW2
         n/BE250MRozYLehRTyFdJZFI+o+TWDZH3vv2Zl9fpu838DZk7zYWc/TriUOgI7ib4+9E
         tK2LtLf84ENask1fHUb57e/lWWos3Fp7z/9QjrqJt/rtQTPhJPYxj21zaAyFxWwxC8Jf
         OyGa4k5462GhHSiAB0m7r4kMLWNgFcNZtT3ii9AShSZx8cfDfU12qFZ4UTzzApI0Ju27
         xmzaMQ2fbTnv+9qcIFKf4ie8BN3MUKbEhpfJYtv/mQ4oc/JyOdCVvXyWB9lmBhGXAp++
         2XoQ==
X-Forwarded-Encrypted: i=1; AL+hErGuO1tG6S+sAP0/m/Yxjfsf8E+ING2xgqlW/sfzRws46e/5TLAj6plNPBRdgRZl+KfLes/F7gH0LundzGR4@vger.kernel.org
X-Gm-Message-State: APuU4Z+QTQTlheCLgeALNI4KjCAeD8YSLtgKtPO9yPhHqtTUJnNzYth7
	TLY+FJesaHj411C/oEu/CQSi5wU/3s9DGthTW6dgyWXwwxJnscDUNrGdYxQdLUn7dw0syKWBuMd
	BOW/4se6m/Y3cHd16Z/3Rt+0qKC2WvshnVGKvsWEooE4TWLqJ2s7TjXbRKbtnypfVG3Zu
X-Gm-Gg: AZFdTZdsnyPcKcthUxRKlK9DBUGOAyldRmCFsyzo2uawoKiv0T3RbWgrCimcPsoHRd+
	bmMSEKZSZFTs2mcXOU6QOc5POmXou41BkIN52bnLkQqt4bujCle/dOUc9OZJw4rmSd4WmWvc7KH
	W4OyjaKk3UpYxYaMnaAnG1Zk6GuPkB66MJLgSr3aQGO4JGH1pkZuNp8kC38xk1Ka5WFKS62s3QG
	XVHScPPap/elREF8+h4Axpzu5nVa5oGS5dShlCLJbqFLn8MtzC4qDi82MM7cN6/FoOYyDFIY6Oc
	A32FvSYcEdHfVBr4+7Ja3G+BqwZ+954KQM67I61/XXavsoZs0ida65LulpIDXb15X9kcs2aM+8h
	sLc01/12WiFLqqWqFcdZO5fdFi7oK6d5XkoQZUlwMFloWs4X8Hj09itFrc4iBqYQuaHXaSGs=
X-Received: by 2002:a05:6122:2bcc:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ee8af63b72mr7094675e0c.4.1795447400805;
        Mon, 23 Nov 2026 07:23:20 -0800 (PST)
X-Received: by 2002:a05:6122:2bcc:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ee8af63b72mr7094655e0c.4.1795447400353;
        Mon, 23 Nov 2026 07:23:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm420368466b.46.2026.11.23.07.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:23:19 -0800 (PST)
Message-ID: <57c90ea4-5521-484a-b829-e763fcf73cd8@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:17 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: agatti: Mark RPM message RAM as
 no-memory-wc
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MWl1nLlWGCxL-k11WYUw9PN8UmCjMhqS
X-Proofpoint-ORIG-GUID: MWl1nLlWGCxL-k11WYUw9PN8UmCjMhqS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX/d19oLziWG1I
 x4P3BDhePR1xgE7NWMZGnBLgcO1NEds9uxxV8ykDeiekYjekXoZ78EYnJUIjQ0IUEX7/N9MfMPo
 0OXGp2oDQdKToW9ED3ti+a02hZ1sy1Y=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045a6a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=948W2wBnRhwx5lWVa8gA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX5+6ZVPib/fko
 xSzW0laduDrHQljFiinr1hm0Dx85eGlhfA7ph13DFWp4TATICaLvlhSX1aHC3fa7TvxbRAbd3dO
 Nb6HBNzTdDm/+WDW5vrqIm+tDbEWHTnY0d0gBb1FR2lPpxdzb+4AHts//cVAynZd33zOdKbpBqN
 A7nGSkHf5lIAb1cd2+DtAclx0pWx2pfc5SwpvLMaFIzDGn+tZWlPk+pz1aB2tdKc62keyF7f+tb
 0Qc+K+nTNKPK2pEPI4r44/BxpOS3I6wCaIa+t9sNJqHsbDf/Uj8d7vaq3dUOqlhHMSTWkRXE0kr
 DIrdxB9M9PqVmlYgqxauJc56a0EtUp2KN255qaQ4dc8pMHQg2RoJaPeeaoqRdx0LeKOciFsfv7y
 2BSDnoMw8z7V3mFT7U0P50JERZor3I/22Pj2tYA6nGLCWlPEekV/W9JmU2D6sRYXL86dSeaeqtk
 sNZxNR+xlXNM4YaWApA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 7:18 AM, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: e3f6a6994041 ("arm64: dts: qcom: qcm2290: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
