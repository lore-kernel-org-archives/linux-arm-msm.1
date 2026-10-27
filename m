Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100356;
	b=ZopWHQkZ724fqjMtMpzf87e+kDUWweslVaBlr29uFJAkqOKV41s+hl61FVDC5WTfyTHd
	 pq4P7RYX4mgJchJexmOTPR6VL4qIgRDWP6egj86ceaZP3VkY45W7+P4O5PYuV7vCV+jQN
	 ZY3e5kcsf7QBJ0cd0lQLou9JFirZedCw+U2vAnbZaFcge6jmAecI52YjNrgPkCFBk8f4C
	 H6cv/Z+eoHDMNhgmSSCsg1gIKqV9WfIGOyfz3FVeec8pCo5xIPXY6dt1t2ui8D5O6uSQW
	 LLa+2KzpqJ6D0ldI0lBh0RGb+qoCtkN6325okLBI+6rRz+r3nnmL18uplGDC8lACT9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gV1fCIZW2NicXlmFikXGuq/gfQCQSMfGDpxSV8le4/s=;
	b=PZFNxpUKqbcDvn+KOMzEqY8M1gVo9GoqLZx/du9AfAfg7e7oLgiWA0JveqbQr4zLKBuc
	 M0hyOY5Q5h1j/0BndZxst4H0NVTwf6T5mzH4fe8ov0zr1xVBLbTgdqAZzE9wVOckF37Hk
	 x5zY5vCLRo+xq1T/k8hCQGAp7d24REOMQ0RDHHlPRIbWjBfMQZxY6YwK6mRzxXdl9peZz
	 xegn9c2lW1YqBmxKm1qlU9SYuM66mS8SXnOiGKL2PP4wr4opzYmdWELFX163uhG3prYwF
	 aiSfL5enZ4Am9O/kx/97CabGrEHivX0i1MaQ4FXEKUG5rMnixvStZMPCcWKQK0u5vyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1uE8HYU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hspT3pBB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B3606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4B3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1uE8HYU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hspT3pBB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBU33012001
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gV1fCIZW2NicXlmFikXGuq/gfQCQSMfGDpxSV8le4/s=; b=Y1uE8HYUsfHvUvss
	Qj3DmyU2upZPPNVhR9q8/VjNENWt1taFK2PCoNcctzpcVmaHSbLjowUZbGsrD48B
	p+CrGgHE94fa0P9b8cx+dd5HR4xU7cyc9zzfR3Hs3ENoNyre2PvGr+UOfp/hNpNH
	y480kMXKzxhXjCExAEON2I8QqphpfXEuE1lVGB7JBLVZy7PuZmS/E7WS/GbXEswp
	oAY1B3aMUX25/y02/jQZ+OfB/4XfcOhM08IV3mfrM04dEwzZB2uS+ubEmQR8E7j9
	iRj1fCXbgIWcLnGR7gwMPEHwl2lqJy9qCJYf8H9+AraxJOHnNfdXIhZQjDBV11Cy
	FAF40Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3darvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:25:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5360b8cf8f5so11613731cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100354; x=1793705154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gV1fCIZW2NicXlmFikXGuq/gfQCQSMfGDpxSV8le4/s=;
        b=hspT3pBBz98ehQ5gB/otIzronwEYvfIUdCOzqaFCl0QY8pVVfSubR2y7TKmBkledrS
         2LZtq7CZnQURD2KZetNdoJQBUiVz4Q0crjcaiDWPRWy9r5hj7/D79U2p3qTi1Ik/VoIx
         JpjgBsyb0irW3rRK8sIiV77HCIcY4qjw8bNU0Xkv6Vg6OQ2Xskwz0lfpi/3ZnK/cQ0G+
         Vy9HvymSJj/8+vr0i2Am/GRtUqPganmup5M/to0MqK6cFk9msax/gHn0dP9hK/we1kOM
         /eat02GGQEe3UUTm0gvKP74vEdFdlmbl1NtSmDVmGhq5Lvi2uA2rly8rwkqWa+U/eeNb
         1lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100354; x=1793705154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gV1fCIZW2NicXlmFikXGuq/gfQCQSMfGDpxSV8le4/s=;
        b=p3wkNe6E7n4TcKbzZjkfO3jM2FHxdiLO1evNcpPIfzQKgg0e0i45XVLnamM2H3KmNI
         G+dTbkVQ2DLwEDcr3YDXdTTW435u/auO13pacWLMet48StaegxbnNzRpzReBAudA/u8Z
         C5rXSHpszkxefqTQBdQmvE95wJJOLEnVxUsSmoUCzPw1zTKAgXAxNK3Fdp8gSfCzJSG2
         d+XE+6YLrHETP3ZaSLOj5JTFeYnw2V/4kYcAbSN7PYiqNCB19l/cs/Aq2xjgFGT4XS42
         I8NHxA6kSVVZqSA7r2Rwtn/Ccf1I1pK4si7So8BWZfeCDETd571GErIk3VHq4597eeOp
         aU+w==
X-Gm-Message-State: AFq9FYL3Dr8rKApXltKhV1FSokkBBUzHkQDdjZk9jprN7ecz+S21CmJ8
	886vkXqwIc6Rz3ED3la4zGUIoVLj+8OhTITzzgoM4A6Yu5AOrm68AZaCJcOz2csKrbA7s+XqGbx
	VSLcBcQLDGbQYSvKW0kgHB+s27tA8brtcmDjxlCP5Y7+59GrIaztjc2nA80EmwX/14MR4
X-Gm-Gg: AYBFou1tr0StrMvIooFQsSuHbg5Z7sHUt381wbzGbQ5P2P7IPe0xbDEQtMPC/KbUITw
	jKIBXYlMGlf1wyzediB8mwMCoReDLM08EdG/I8EoFu21medawL/UajlZocp2w4O2QzpZHJs6dvc
	Orx7rMrCcxWTPkaDDwjfUFALBBtiaitaUJwtutBsm1Rh11Dwi9ZwjK7KrXi4QIuZyuAtmLdVq8a
	mjU+wPDSMyOboAL2dTx7i9VMC0t256iLcFqisrjTRzs6qB42BZb9x3qnzFxWTsuYJ9vFsDarmSB
	giRfbpUePZEEKjYxGO358IOcd0lJijgXp/abDF4PnEX1lxRB1q5l1ZRdSgcQwpbzawzxbZg7r+d
	U0xJLnU+MEh29826ASj9E7w==
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr135312641cf.0.1793100354116;
        Tue, 27 Oct 2026 04:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr135312391cf.0.1793100353679;
        Tue, 27 Oct 2026 04:25:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45e167f4esm3315889a12.2.2026.10.27.04.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:25:51 -0700 (PDT)
Message-ID: <7e6cfbd2-c54f-4a21-af27-f681e6ea19b4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:25:48 +0100
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
Subject: Re: [PATCH v4 3/5] drm/msm/a6xx: Factor out the common BCM list
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
 <20261027-adreno-a620-v4-3-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-3-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX0CA9TaV9ei89
 eCUA3ugH7fhduWgau3jXf+ToJHDERlVmakSi30D7W5DDR5ayHdrUIUtuHnS0YEYn+G+EG6gU4ps
 iS4TxqPhaNyiB1Z+TVywN7qZstm90dQ=
X-Proofpoint-GUID: YXmfcchXGXoOcp2W3_R7NXqisfKEzIcm
X-Proofpoint-ORIG-GUID: YXmfcchXGXoOcp2W3_R7NXqisfKEzIcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX64rwpzt67nzW
 w/lahxCtCfGYqsH3hzas5Wucz6UIN8EBO6lLFcdaV6QP5wFCsl8fN6g3448E9ILJd+IgGCAJcOd
 7EcVSMKpeFcOyY1ZgDxqn7WT/Br01kOFUouzCjp9rKBqD2ugXhy1U3jze0s5V0+YTxBf8WLlLqP
 ztQecWkRsZ3Fy7RXDhrZjc8HNkSJlN6K7LaF8tyurwu9bViMxeS8HIUGOGPxTrWYKB7k0WAjMo8
 Yir/ia9C7kNXzCSbq70ZtqQpesZKcOQGmZeDUyhBuMtFkAbWlO7siQRVuYsBKVQWaHGiIe6Qurq
 OWDJ0OY7/am+zQUzd3gpzpcFikTFiJgmwYkaDyUfmqPxHdyTAcBkGeffltrT2EAcU8GWifb2v7g
 2Xnh4x+IVKwjryAXfW2jU4DsT1Cv9/ioidN08aQjcXuLDG7FeYT0zDmpNOkj9SoBKX6PSnQT2/0
 e6kLecPXU3KMnSx+ZMA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08a43 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=J8-uP8xFOBs1Kl34Lf4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> The A690 entry carries a list of the Bus Clock Managers it votes for
      ^A623

Konrad
