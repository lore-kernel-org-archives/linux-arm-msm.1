Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772998;
	b=DSXVs/G9vU6tfd87CbMovqRyykzWXAfVqXvyBBirIG7KLXjoUUIBBvFf/Sx1YEQ5xsUA
	 myFmwDRSxOVzSP3CFqr+r6KyJ+ahK852XCvoeD1OvK651nFbD1+hbSXEnZpUlfU8A2sXB
	 7rzeVsgLp69+ZmkLVwKSzW132/7ki80781KonIweNmWQycbJ2TuhkV5WaJ6u7Wtut1K1d
	 I2awt8gVJmu2r3HQi4VWpQkAhdfM8Cu3CoCdgozpOm4HYrUBJOtBPiXvRIVrrX4qusJr8
	 iy0M4YXVNVKJ7NBXTESJE/ZXrV7K+PZ9OXwgjkz5jbISGzm7HNSYJ4pUIc6Dk4ZEsqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
	b=ah55uU7HInS35RcsQYm48QFY1tNThntsiGr6pBy/2/kL5ODOKslI5f/vq0Y2lB2thKy2
	 pVOIGmNxbZ/JMRhK5hmlEfo8RyweSulnzWZWsZAjc19BoRK4l5wUwKyYN44ph7GVSWFHq
	 IQ7uae+kirk3fvXcU9uH7F4P1PlUc1J1pzV0kmAT7SGPNfH3mOoVB89WD1PS+SQm12dpT
	 iqKkP8GC9Xm20y/vgSxCKASr7UrIowOKTDXUacRJRFow2Tg2dM13qTaMKhTTJJ1eJSMJI
	 Hjwmczv4yReZUeyu6bEmuTZJ9sdxa6wQ6IkHhYmP0HDyWeiz67QhEIEqMo1CdPxEzmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=obfICoDJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9giYd5x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D46606A6A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D46606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=obfICoDJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9giYd5x
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7HvjQ3118096
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=; b=obfICoDJxgCSIHVq
	1H2m4OsJZmwrrNOkmSyZ5PCFuHLydF4UHCKinlEo20WiN62lEXqg8fCrjE/BVyRL
	T+SLXWOy8Z0j18JjAfAvm27SoQTXYpUSbb8bmYvHjSRTDL9E/zGTDF7lO79S7N6t
	P4H1x1ULr5XGWIdnr6qI8v5aALiTNCgFnldXX4WlH/lEkCLQidFYyBtMZhIIbpIq
	yPxi1NMbVXXIILZs4rEbm0Yj3P2OwMYwpOesSv8+UCA7W1sDdaD+/rhtQJaF2LXl
	BWjRYP8hQFzHaHoTOySn1+/zh1AGahS5F9wMKKynuLSQImyYJzqgIq/E1kwnJCRD
	soScFQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh91bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:49:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f053f9631cso94968795ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772996; x=1796377796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
        b=f9giYd5xDCxK4f1w5/qTkfCdb4CeHpi8ruUnxzcVpY5nNmQRBB6EC8meML+tuGAirQ
         Lj3TpIFKOmdGGMSUKr8gspT45PCKPxYAtJ/k6Exei5moJDAZPY8QCzjDF7rSDsij4dt3
         RkOyi8XyModNrMyHl4NB5qnfjdSATuJmwRdnYSyHtoSINhVFESguw/5KqRobLSA+b8IC
         krzJU0g6n3n5Z1bXoRm/jRlJn8GjjOXP4Co6JxoZpOeyvs9Mp25pMV9WfSnwD9FulIwE
         v/hD3ZxPZQkR5yAzP0dYYfhJFEZZoP6hiKFpchX6DTRpjsn7mWvs5IO7128d8ulTP+Tb
         a3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772996; x=1796377796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0Dnai2mS0jKW2gFMXtdOeHQc3Vgz+AH8UmEJxjmLmI=;
        b=hZM1VMKYlfi12KMJPqbIC0PB6g87XYq9lH81kuupK0knkcV4P3+AWGwEm8Ull958bt
         rUWHVb6pTFM1GW8HDVov+bIlZeTYfcgl7cJUDKs8viaX/9s2bak49lQjwE1J8TtjvccR
         qalv2YgjOD+VxWmFc230hMp0gcUxIHzSMg8mvYxAGhjgz03EejBEl9r4uQ7wbEgrpkjl
         lzOJKTamkxmXj0VqTmOPAEjgyyrc73Bc/8MW2s82fVzQBHFXwPC2n1mnRD1eZy+ewPr3
         JAXfyP6Tkstw+UAdGSG4ATU3oIYnaIUhleOQ0tECgv+lAWsRjp1UnSWyGtkPkIxuS0K3
         v7iw==
X-Forwarded-Encrypted: i=1; AL+hErH+nWOhtb3OElX5TFFRS9CpwebDHEBH/vdaLxfwrbx4NKenQFjOjYBccOFowJjXPVypa/LUFUVwAJByKfM0@vger.kernel.org
X-Gm-Message-State: APuU4Z9wZnO56U7TarITS/xqGxRegCyWAyjob2CcqR922Dc4kpkBaSyi
	CW2xwg3KTHEKktAFYRbxuhk2jXR1BjVbKqCPfKu/rNEL8xQJ/O39OH0rb9e+xeBpdS6eOg94PAZ
	nI3d/DkM2Cf+v23WACXDrtj9mG3rMTnyNYuwiJgPTACPzWEBIyeMmY2nSN+1HraDxtx7W
X-Gm-Gg: AZFdTZewlGLa7frkuQqwnJijZc5zS6jISUoLDAJIvqO2N7NpcRcaMrhf3+16NXyQDrm
	rIleUjwSSEi3AKy0aOD4vq9jPWQGjCeTl1f2VpHS4Qcc63sRi6ienhCNdO7slARkOqCQgmfzchU
	Z/wbbekezrcLvNRMMwwM+rEStUPqdsurak8mI3I9Sb7ZwURSZG5WR2AuhSkBjQsjaN9vTVBTHbO
	7RZsj562nBKMfIeuJ+Wa0Ep1uiSmKB6Tq5IZvnIj4luZeI1djHkLAxAyYC155hNEzY5M9gGq5kg
	Uq51KaG4nZ5LGoxWlsk833+TtHTIJlr9v6nNeQ2DqdB5c+CZeVfzUIf4muY3FmxrBv6Ov3bmlry
	wau5yfGTwkhaYMjD47UhWNy9SF5y98SE5h4/U9VMgSfbfaC4fAHLus9zE9+qJcAaUQpO9LspGMv
	3zgq1itJe/X4zjPtLci4xyKXKHTpI/5Xcw9wbF+dgrAuiyJILtl2yxT6fM26Pps9OG00JsUSBqf
	9la
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr252338285ad.0.1795772995879;
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr252338105ad.0.1795772995384;
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm115916895ad.72.2026.11.27.01.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:49:55 -0800 (PST)
Message-ID: <917776ae-ab75-4f81-93c3-7e359641cb1e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:19:50 +0530
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
Subject: Re: [PATCH 3/4] remoteproc: qcom: Fix bounds check in
 q6v5_wcss_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-4-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-4-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXyiKXugmNseQs
 QTAq3z0YwIGiMxPB8yufy0SqlOavgXbMzGHWZXE89Y7pYGNFFdRoHrflVDFVuN1j1C2bZCKMoAB
 RCR0r60VtF60LiagPVH9ybCOKKXKDfF/CA8nw4eQEuwgNmxiyjv2V2qxX4xCZ4PchyYtHdfCbvf
 olepmzz2hWjLJA1ErBth8TwHtccNVqV74q5eRyMWighOcGgw1K4tLsdlhG9G13xl3WISA4LiWC+
 Z1egZXvOiQ6Vn6AghEHetN64PeD/aUmoczqhua08Wn06dtsV0BpRsAySQZBcHh+V5HYUgstlGB7
 cAtpD9l9Ac8nTi+FF6pd3fL++AfAil6JvbqhuyoscnPhAeAfcGup7xugPjTr5Gz6rJNSSydAcHg
 O2XijcwWe/O9Ci2D4XNtcSu38F7/DqMEnayk3GT0Uy4LmMx4SaDeQXeVah2E5aCP6RCqXxg9qzt
 SoMyss++fONyE++O7sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX7dhCjV/kg7mK
 IV5PhQiEa8+v3LI94ffF9Yd/v6+dnu0MkSpeUHRLkZIYlGhNcgP57aVcyJRC2ZkLeStU1HpvRpK
 UaySWmRW5qGSeBVDX8TaQMcD/m5VlI8=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b095245 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ij1-ZcgWA4wnUHMZnqSfRt_hlbFPWjd9
X-Proofpoint-ORIG-GUID: ij1-ZcgWA4wnUHMZnqSfRt_hlbFPWjd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - wcss->mem_reloc and stored in a
> 32 bit signed int, while da and wcss->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> wcss->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < wcss->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > wcss->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
