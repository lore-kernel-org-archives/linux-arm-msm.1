Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100380;
	b=tvHVqrJBbSVLk08sVuz45iHtYqx69a4SNoqfkXaWsyLpw1su3d9637kdn+r1k+LBVY50
	 OFxNiUVnj04GD7vqg1W4DSCVHeTPbnQjyTLFfb+PU8YGhNTNyCRQ92eqc/iCrZOUAdKKQ
	 QVWsu9NEfVS+AXDIsjZLt0xhTqcxpzf7047utHmVClDzQUadtP14liOqVC0QoVZyxEYYO
	 B3ILbD75DzKbmrNj9VrG5noAFsGv+Z/LCUoEdKMPQAy8yQEbx9Ygvi1bh20P9qwvZXPxe
	 ECuvCkIsOGNNVNJodW4RRNyWI6YfpyzfoZNFYvWA1O300Z1HJlNDT1WmI3Je6yEWpnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100380;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Is45whwqsC64wRcmSgLSpefzFyl+UElHhTAj2CK2HeI=;
	b=0NMPafByyhaRiuSdBTvvsYptI1bAZPgm6NNA6o9DsyNw/0FSyGBf2sNzzjh92rw71kDR
	 Dcyj2qufRvU/V4UT+EwPLKmm1IfvOg8gZhkISuI2QRqn4jSDhPov5FzM16xHtN3QSjBA7
	 leMO+T9i4SVSDn5LIWfohE5CckNqpFZuKs/eLv1Dq+xDxLgH9eGAnJJfl1abtmUkeubIv
	 2Z8N5jeHGRzTCDP3XTn/2/uMoFJCa7xGcA0Ds4IiytprG1yMeMkJcD/5lBfBwRXC7XfUk
	 B2iBICSD1vs9uSYQEXfyPWTLX+vD50wQpFLjpOLmv450CqL3Qn9WC19vgKB6VdyJGRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FSXnVexH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h0t7HXJP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E87C606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E87C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FSXnVexH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h0t7HXJP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3oB432370
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Is45whwqsC64wRcmSgLSpefzFyl+UElHhTAj2CK2HeI=; b=FSXnVexHsWUUmE7L
	WoEUfsQEmcNq/N2oKjYcqq/jsZA24/6h689K84srC3JaMsmNFt+BDnDa/KatF6j4
	SpkYQem8RNRZuGhfXi1Ky0ZdpoDVILBU52sk3zWWR2VHQsdgqmR4XX87Q+PChWuE
	mCiWwPDcEdkKbLgPqg1ofxaFPNVwReJf75PGkEzeL9mRDuIwAmVS7lLM/uhrm4x7
	nSGyT+dwCER4+AZuMpBm9Tq5SXdzOybCp5IKM3zQrEKVAckVYAQ8PCIll9Ajs4pj
	5oKnzwkL2v39ziiXWCj2CRqmrbwLA4UUNLo4ZswsTLTC2fvff9G4lAiWj3jhn3I+
	LKr2Tw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54khd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:26:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso15761651cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100379; x=1793705179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Is45whwqsC64wRcmSgLSpefzFyl+UElHhTAj2CK2HeI=;
        b=h0t7HXJPKqezz+7BLn0828Iemtz435SFmHfAYiAzvEzo6l3FDBqSXKmFpXK6ma+lRe
         hSvB17opcv+bGms7L81t8X9JzgfEBkKbURs53I/jdW5A/YYvtIwapfDuq07ZkSZyulIw
         LS2A6wGM559elILKCYTr1og3lCuM9P1HtrtEz25JmhquxlwhkQbpmWQ6ow1PIDHLQbbo
         adGapAPrTvbKT4+N3979kJWBGtw65+lVNfVyii/Rs3HzXJNlKWK7KanSsi1eJnepafrj
         IS+AszHdxd0sxHwg/Z3/fsmmBzwOmv2N7DDmWR3zcRlrhCRDTDRWsiHjnuH/pO11e1ZK
         QnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100379; x=1793705179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Is45whwqsC64wRcmSgLSpefzFyl+UElHhTAj2CK2HeI=;
        b=sNW8IO0ZIUmYuW1Q3FzOVkRrj77qX62uLMGGt5yeye4A5YAqF0TREyVlGjEJtyIMjr
         pKb8HEo2xqfxKM0qj/wAlHsqP5ESZJ/eEvnWsWvfA8W2UQppD6mRDPQGgSP/59wuzLzS
         HT6nUzD2n8iY2xt5epn0DCOPbzriyMNXzj1YN4GbXJE/4DkgnIQxMSSmK3c4veMBD9NO
         xkj3Cz1rV7qOcYLmi1vCPBEmlTREn7LSwWspAOrfIih50EoWNG2IgRQSsRQ3h4v2pg3x
         ELiVTxmQ2uQyAD0s43kH1Y98yfKIf34B7FRczxFFbVojWIHiX7RR2s6CaRlpHRhgNBH+
         aDFw==
X-Gm-Message-State: AFq9FYKK/AOjTKvgFzlmHDcDxCMksH6TrBZsnHLLIRRaeuJ3a7YVb//l
	LydgNxakRfe7UulUpQzk3dWp0pxzGjqdii78Of3lIxMLqlD/zObT7E+y0BAlKjIGwi7d0kjta/3
	ELUx3LDO/rgJKjg5iluGskLhgWsl8lMuJ0zn0PUvK5gSnFivGqnGLrSNUN4mXenv3k0FZ
X-Gm-Gg: AYBFou14R64xq5FR4h0DEC3EDq7AngaGqrSnv6f9Siaql9XFatB7mGtpunPLDiE6utB
	g5lchWUaMDX+Rv/leoWQgTuTYnlYDdU2Jn8VNJ+57aUIYd2SLfXt0Y3Cu151rqDNX/H85dEjfKS
	F7kj1LbjyN8CkBi1uCiBbhGKhCHQ/l7GHg0rdUDQ0223B4XVTKh11e8w0j9AzGvHVkkkDJlBAF1
	O7U7iCT52q11jemhL1APxE5ivdRAPDe1Ul9YfoJ/4nonoZpiaQ54U6iZOyc0/8YtFePs4m6/YlB
	yGipqK7gfLlYECGZFZnnil7SUZtelHqswWlqCtAaDYhYeS080rbfe04eCz55pt70qPvQZPrNHW1
	c/D45ku5kHglVA7J5ZVUP9g==
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr147751391cf.4.1793100378515;
        Tue, 27 Oct 2026 04:26:18 -0700 (PDT)
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr147750931cf.4.1793100378081;
        Tue, 27 Oct 2026 04:26:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d5f3sm4862904a12.10.2026.10.27.04.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:26:17 -0700 (PDT)
Message-ID: <ea023abb-6a84-451c-8f98-039b8e4f5148@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:26:14 +0100
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
Subject: Re: [PATCH v4 4/5] drm/msm/adreno: Add Adreno 620
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
 <20261027-adreno-a620-v4-4-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-4-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX1PBXHBZ797O4
 c4xBJ6osfVLXFLc/7AYUGjiNYxhKMJqRuxVySv2gpDYdp9wBnRj2Yq6UqprtqRPWDbA9pMfakXy
 wPz8K04MSMnoVCinsX2rDv7ddd3UK3I=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08a5b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=al468FGD6oJmqlhVjCMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: X7hpdKnQ4E4hPDUr95C1xXn_VOtbl4Id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX4eBQ/nvFvAVC
 5lhSCeAxJ3s7ShyQ8SbGAKXwe3I7cokJBfLeQdYG3nkQo4IpqKj/vZBdcLWERBX88EMUKJeLuVR
 OM5CBSE+Dml5HdUPCw6uamLGCUotmOnJlnYhe51vjq0ML8+WMOH2ALcVQ0kKgm46/laDIUf0/NE
 xtV9UxWDg+Sc/FZUhJRjpNpGecIIR0IoC+j/0VUR3JPQMRAyfAu+ZVA2H5HkxnEbGB57vj4ahNb
 NAL+l5Muwt/zwZUJXWP98uLORdUZMlY9WVE1e44g7bp/Bx0FwXJnL6n10GvY9BKzdx++m1DoQCW
 OhJKT90xiUsIIT4jYpSHh4rkhIdld2PNKCIpO+6az8QA+AI/LboRmZXKMCoQJ5Z5hxsASXjn/eh
 AxFsoQZPp6+qyk6o/WFGYP8srn1Sv7pzO2V0XQQ29fQgWQkhntypQH7xpEa7pt70AZ4/fhNxr3O
 a3IM8WFVOS/YDV4n/9g==
X-Proofpoint-GUID: X7hpdKnQ4E4hPDUr95C1xXn_VOtbl4Id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add the catalog entry for the Adreno 620 (chip id 0x06020000) found in
> the Snapdragon 765/765G/768G (SM7250). It is an A650 derivative and
> uses its SQE and GMU firmware and protect table, together with the A620
> zap shader.
> 
> The speed-bin fuse values map to the OPP bins as in the downstream
> "lito" devicetree: fuse 0 is the default bin and fuse 132 and 115 are
> the two alternate ones.
> 
> The GMU clock gating mode is 0x00020202, which is what the downstream
> driver programs on every A6xx except the A612 and A615 family. Use the
> shared list of Bus Clock Managers so that the GMU bandwidth table is
> generated from the bandwidth levels of the GPU OPP table.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
