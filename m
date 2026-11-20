Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168271;
	b=5SJSoX6pWX7j1DDwrIKnrzdn3M2KUA8tD1cZcFSng12msq0keWPCGyBVfEQn+N2eh8OO
	 XbiCik10bYic5OsOhX3CsWN07JoNu7R/g5w0RqcVUsKcCJ5LaJroAYwQzOyohohM8kk7N
	 8dVjJZ8SFLGBy+SILMlENioO8fR5tuw3nhEFdsSoshq1KOKOcGXVabutU84/1quqSr0eD
	 3kLXG0ATIOu8DqTYIXP9nhf16ZfZvp+6L9UmEmoXc2ypbn5iUK3w6wYMCRNrcUGLPX9wZ
	 JtNh3vJKApUJMK3VrguLkbCuzgCnSMGA0gC3eszErMagt0xDOMLPGLkviDW0ILVKKyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
	b=NW1iEkshAwAUdeQijewVfxYr3eeVrB1mudtRLD7U77wRnmuo2giq41U02g5YDmK1ywaj
	 FoGgO0pa9E9kTP3ptLE+pFAI+qd11hB0b8oHfyUKKB+Lxz0R5C2tHf+oxdXxPRZ2AwFDO
	 xLoePOriCajcIZzCNvETY42Os8R493hXZcFHhOUUz+Vb3iOvV4wsTJeAIbRqkmsiuC1th
	 BWS+FMPUDoX6N/5FPrWgQkciRjYKe4z/DL0M9ExjpVZERrJuL0i7qBdMeSXViDo8DVDFC
	 MEk5edHEttB4tSZbTVdWHXn6+aVSs/za3lfjOtySE1X0VdaFCveBXk9Syb8aGOKkJIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLQhuATv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Dvk3/9w5";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0589606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0589606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLQhuATv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dvk3/9w5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewgE605974
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=; b=XLQhuATvbqxovLlT
	dL411IJrhlAJYPNrAhk0mgGnBLMSHr/hV8iTE1AqWbuQQdAoTrHyzrFCtxbrcwQf
	DY6xYi3BhFoT+o5+BDMztoA+oWyYqEiqXXKJOkkfL8JdScJdLUQ26+9xJvl8Whhi
	+D7eRf7/P+sYWAztIAEKOZku+V2bVaYkRqwj8ir6fh00+SejGPOWLEtKzmPxu6F0
	VQE4cGvqAWhoRoiSUKqmRHBbrIapkRDF1fJbBXVBvj64RreyBBgssxLA7mXllHZh
	SPzEv0qRcSOsjfTytxwHjef0zixTExVJc13XINk99ZZTm0kCe+Q2/0WeNOTQ6SiR
	Fa8FgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrx2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961511b61so133435485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168269; x=1795773069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
        b=Dvk3/9w5vlyQrW6bzgGEPRiL6LM4nsYAPPPR+Z/WIgF3SFtDs+uLIhxTQccYGVY25v
         u1caU8w+67Nvso0WQeuc6rv0YpaVF0EkV66vz05Ngj/cHljxL8vjJnmFGakcWIwopEgo
         fF9JpuC4y4tnO8XXt8zfFqzrB/ge47Su/1CfH03QByoswU69ITaCC1LZFe/jpHRqYJT6
         lPij0qEKEL8HwcjI2RNlqSiKuFfgdpPiuEApolXmVBI/Z4IR+nVt8SPjsrramVjBs4x0
         HvFhrvJlhN1lLJ8xEb+jl1YGJ58+/yD1XBlPmaKeeG3wx+wxLhtYFBOCDgWVOoWvnevQ
         5GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168269; x=1795773069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
        b=ZnIj5jTz3LgrNnkffoQAyZibzAtQVlfMy+87GzXpCX08c/NqfEaqHsnZZGfqCYu99o
         e6Ii8xpDKGfz8RXXWQXEeX9LjfOcGHbrUR6UNSe9CGPMS1si0GD/PfA8M4t5JnAj6HRk
         MiT/PeRkBmFF44cHjQfpP9S3xViE1mF+h7le3RQsGc1ODbr9pvIMQaTYUBs/nsK8pr+d
         O3nQUuoA2RYm+1T00MmtX8zmcpsPDtwRt8iT7R8EtxoBD1VmmqB9qMkc+zlGarYLvqtx
         X1Q4JTBJajXqjh6zeJuWlffXFarjNXJzv+Djg/x3lowcIe6JISE0gP5JpI3LhpOaRLaB
         YFXA==
X-Forwarded-Encrypted: i=1; AL+hErG0oRMSb20I5DWBi76RWY+VXOA7A+VlMf9NmPrO35PcDwBDj427ZcIwnV2xUKojhWLTyhkeuTQ3pyEygHh5@vger.kernel.org
X-Gm-Message-State: APuU4Z8KbNzhM7+q04/05LW1zGajORo8pXRFJEkAOKN0TG2jeK4UkVvt
	IndvbYR23rOZugM52g6mX1J0lI+Lkgvtn5HEP80pXlK5vX+XDEBNSlMOP1q0REBmjtKEFgi2GMB
	OxeJCouwAfMmFJjNfwebeRNENH16yRayGxbbo7nH+I0RN20paTASMWIeiZAkFBqxMcei0
X-Gm-Gg: AYBFou02RtgIsyny5pnk7wXPbV2bZbEFtfgkMIk3HSTdJFAeM5xWXMRyG4ghwRBBjb5
	IW1B/sznvyrgtDW/5jd7NzRDCAZtq9ahmI2T+UbkJQbrdnAGbyeWcDpQ2sGo7mNe2ZMu1ONcExY
	zyRvNrYA7CtrUyGR2rlpZ2IGHSr7gMK/phKoGNc8huUDXRlypZwTGLTXxdubDmWHfnMhVqZmxfN
	1ajorLjkFok1DAqYzudpayo25V6h3yBePpKmBBRCIPWrGn94iTuvN7bkHKnoJVO2Bo5BAPSZLOe
	qeqS2wd3+d8NbQOYeMoQMgd4SDMJES6r6JFnqg0OlYUjyK2JiStFrQVl3xlEr7CtuI9aCrRM4bH
	vjxvq0lL+9iizHdOd3K6KloiFfQZueHcWdsyuuHwpWUuu6L59Cmyy4oq1VT9t7Wvr
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr372403085a.56.1795168268938;
        Fri, 20 Nov 2026 01:51:08 -0800 (PST)
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr372397685a.56.1795168268270;
        Fri, 20 Nov 2026 01:51:08 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4524417f8f.3.2026.11.20.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:51:07 -0800 (PST)
Date: Fri, 20 Nov 2026 11:51:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: nord: Add GPU cooling
Message-ID: <ajoxvv5enftdx6phawevgoky3hijrk7asx5g55u7cmcdjrlntx@syh2k5q27bwc>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-4-8d6d9908b7c5@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118-nord-gpu1-v2-4-8d6d9908b7c5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXyTJPTSCozwhB
 eOR6Zt1VKy04NusJuR9VaK0focdNN3OjYm79gg3o1Fa5NoReJmneN67jZExR3DZKJJFtBHKl8kN
 NNrcB8PdsQGXbIT4hgeAu/c0L7RNoC2FU/nG3nxUhSMPcNUkUdCWW1eFaMf6e/iDzs1V2rOX/OP
 vNJsqlwpQosVA6ITp4M9+O2iOXlglggEDPIA4TH7RRwqAtk2a/PBZDsnuLiLcnZSyFXQmpFoHd4
 R8OXjuXDACtXee2FEc4919F4oGLWbhiilNrBOQJhEHhGdBNp5yJt3KN1BumTg7KOMZHKlZhkj8l
 6HuO+DudsBr2+YUf4wmDqESndh4QkJOOBQrVbUHsFW88elX2IywqDBBxPDLL9TSMKnKWYPnChWH
 AGq17sHoyDHFX6W9Np338EcZy+tPTB0q7kT2EUuf8OaFeAvDkNuZZaNu6DP/npJt/zO2YLmblXC
 EcJ8WAzxzfvAV/7DQfA==
X-Proofpoint-GUID: 0g7DpT9hyoQN7HqWO47YKsVxY4huE_jx
X-Proofpoint-ORIG-GUID: 0g7DpT9hyoQN7HqWO47YKsVxY4huE_jx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX/CnU4PVTJoqN
 lvebnrhieDr+nIo80K9YonUkUGk1eGVhGzVQaF/mxNPOebyoeDjR8mTtg67YcOBpMu5N6gOianE
 UR+0nBv0JrGdyrjORbpijliPkVTlhvM=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b00180e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r-Xe3uw014UkFQyex58A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200039

On 26-11-18 04:30:07, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when
> it reaches high temperatures.
> 
> Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
> reaches 105°C. Label the passive trip points of the GPU thermal zones,
> map them to the GPU as a cooling device, and add a passive polling
> delay so the thermal framework can monitor the zones while throttling.
> 
> The thermal zones and the GPU node are both described in nord.dtsi, so
> do it there. On the GearVM variant the GPU node stays disabled, no
> cooling device gets registered for it, and the maps are simply left
> unbound.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
