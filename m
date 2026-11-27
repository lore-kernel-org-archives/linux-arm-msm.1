Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779365;
	b=namdhIJALUo3ghnyijsm7e1zxKvnpxo+BeiRtj+/8g0vQNpwU+yVhq0qwvj54u7FXoZM
	 h9W4L81H82URM53JxcezSC42Vs9X2mUhvp8MSAh0KUkJu4F9qQw4j6mzdTt19Gav64oEA
	 5QxPhH6TCk8T0n6WvWbuNNlxoEd6dbKNkHuf/+RJuRcIPeg9uBtB7q/lTRFY4ZT3QCDdS
	 vUaGvMe+szm8Wzob9bUBKSHK7pwekJOfW/PMT3vt+R1IK4D89bEHz6zAGwK5vh+EmL/pO
	 CStDJM6PvsJGASB01hVvTHcrKOUJw6kuiA8h6xK+so3JwQ87Ux/t1q5P4tvbT8Mv2DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yt6Wg2PGAori9gWmE6+3DV9MRCoWukAywgV475EEoqU=;
	b=oIYlFMm8MbDLmLGzfWJeU8fMPuBH1GDTBK4ZQ3h1YH/iPfx8sXRNsqS+CAfEKmP2dDhQ
	 HmPHv6pqisQcnunoO5EYsJO9HSjOYU2nuUOgjYSp76QKcF8iZCK1pqRMkcmCVbF3NCCHO
	 b59D195n+PvjKXxGJkZbVeGbUt/GAli8ZALtAKZIJkspJmWgTM5XLmNElVBH2Cx4Erje9
	 fiyjSpSkD3jf3ENZULWAHGrpr7n0yjYiqETeXHoPscbi/1KSFAt0AgCov0fU/flYsOOoQ
	 iEE4HMHwbAdH7KdlxKEGjUd73hy5L/qAzjyNMi5noFKLnOnPzlLze45IKlPyxWwPD9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoRTJGR+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUS9mG6y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE853606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE853606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoRTJGR+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUS9mG6y
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApACV2677163
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt6Wg2PGAori9gWmE6+3DV9MRCoWukAywgV475EEoqU=; b=RoRTJGR+DRImvJ7H
	GnUu9U9almkAfBFx1Nxub+HHDBej3r8QD3Ad3ogl78ACHGQPjJQPlQiHV6DRQEAO
	FiuLvdst/lswoZ5cmu19ojsoO5FzyZYc/nUvyQy+yjKIbY0v3+CGXf7kXfF//Awh
	tZHwmIj3bzLMg/mEYOZYd5zerfDO26nIKw815tkNdTNYXgjsBoPw99UTZ757QaJu
	PtBPfz6l9/HkJZhGu6iQNq9j0CyiU5GJq3B0V8Z+fBCcjO5foB0maS16QlrqN/3B
	nLNXba0tex7bhplpE0buyM4HbxlcsoXuRsXce5TehP55GaJrq86O/ppcRzfOjA/W
	8ZN/SA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh970s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:36:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53657d237ddso11284611cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779363; x=1796384163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt6Wg2PGAori9gWmE6+3DV9MRCoWukAywgV475EEoqU=;
        b=MUS9mG6y5el6PFbdEmbDFqHNc5RuiXLVDlcf7fWsSptSvRUkXgtK/03qf6CV3ZUcwy
         LG+WehhlnD4V7DvRF7efFpTeUezQDRcNsO66ztIBLgoM/qUtnKz3eYPQ8PfH0CX27fI1
         TYNJV6/V0SLGOuZSB2g7DYm4Y+JOXnUlG8JVEWVRZakkHdtvsz+wN1SkIlJJtMpBvu0F
         mFOUw3FEebE8LhZ7XRWjVmIXych0LB7XsYfAQb5ctESz5i8hxVuZ/ud5Qe0pRZwOtoPg
         ue/rgT/yu+zCoA+INO90AO0Rc50Sy/XKhznT8F6tKFWqVlWrSftqLquXxbNfvOlnJjNi
         eckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779363; x=1796384163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt6Wg2PGAori9gWmE6+3DV9MRCoWukAywgV475EEoqU=;
        b=NVDQIgTV5KOY0m53dkHwCLziuNci6bCxT1gX8aXOuG4qHo1s/heceucmUvDSoGF6S8
         dGMOUJB9uLUaYqU96Nd9LEnj7+MbMRSzRQUYBOIpnZWKngKJAl+BQ+W+po3hLwe6olbG
         lzdR82nGPAp5NCJyk3Tclo/GAdFFGmEW65JfF1BzCVHEgVph5cT7BGWeD+yybOYBAuAV
         LgktOcUgM0+2tBu5hI4JsjQQDHbqyxJdUnebMukCkVUey61gDkd42qmLxjO7bGzh/JvW
         NJseeCZMjdw6naAJVO4N3glxjTXTHCiMOlmS4G3Z18Nk8rS9Jgdax6qS4QIn565DMbuQ
         pNjQ==
X-Forwarded-Encrypted: i=1; AL+hErHo35B++Rj/jsTxGvziPKMXe6hakD7HWGuY6PredVsYizynVZVFb6T4x1ItBWuc89yyLmh5Il7Mo4mDcE83@vger.kernel.org
X-Gm-Message-State: APuU4Z/T16ECXVlCQlW/IcucZyENGkjcF96lHpabOTksFDI/1cmIld7r
	hRf6JZNFT+aVe3El7OqtMpxj6YBtCzNh6GxvCKC0fsUtDi1gTgzxq7eXArAu8vHohIkqWXDKdsd
	BI1DKqJzMg90kwg7utP60i6lriE3J8gzi+jcdiNL4Y+n49EiqNmN+wIE8ehsuBV5kKrllpsxCRA
	o+
X-Gm-Gg: AZFdTZfTvYTEVKOUiFXd6iAIo+S/yDmlfUtbFCyieAbCIypd+V41ffZqC3i29grsMJK
	BF8ygMDDXB7pAvQ24XoRhYEJ8AgYCpjN0YwuQoer/2gw2/x02uajxoBZFYgowiuDBEh1E83IE9R
	7jwC3bSkCEe5lcb9XWDh/yK6TyxDDxFwv+P/tirMn1ZU7UEi3hRBHbs88OqscATphCKwqEjI9Sv
	x+EZGOw/iWn6fm2pVa+0cPeSga0cF1tQXAdTkUuZ841zud38xA/3lEp8e//bEAC8tWrh3q7GOw7
	fA9WulChWo/mi2EjXMrrMqjufL+6XqXBIvP4mQ1m8eEsFmpTk+x1ivmdJVTCjv60uRUPTmYdqjv
	iQV5+5cA67qeUN9T1criNEyqcQNHVwSpnyiOG4snYFd0fHxlgxbaxaOOZroKoqE4Sji6fLO4=
X-Received: by 2002:a05:620a:8719:20b0:949:b116:182c with SMTP id af79cd13be357-949bab698d9mr3909059285a.6.1795779363210;
        Fri, 27 Nov 2026 03:36:03 -0800 (PST)
X-Received: by 2002:a05:620a:8719:20b0:949:b116:182c with SMTP id af79cd13be357-949bab698d9mr3909055985a.6.1795779362774;
        Fri, 27 Nov 2026 03:36:02 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm852363266b.45.2026.11.27.03.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:36:02 -0800 (PST)
Message-ID: <4eaf44b6-90ee-4f55-9f78-c2f2f6a530b7@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:36:00 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: nord: widen SoC bus to 40 bits
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX/oIvD44ZrQ81
 PiOVZaL/EVOKihwKaXPY9HLpOaXKDqVeFCfqUKKBHtE5LcPzTHbLw1feOXLICcGCzHCjsJsT8h5
 iwI0FkhTA6knpq73AWeEFkUNdzDo+M8=
X-Proofpoint-GUID: JpIDoVRh9IZmjK0jazGyRCOZfTXPkWj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX0Rldvz6PNCd/
 IirJHsTS8CjE2RBshkMdTuV+Bzk030vYXasvun/SioS9/DEzkSVsfobURCW56RImWR0JlO4v9j/
 k+hwTn8tKHfZ4P2IR8M+Pu27K9t2gqRKMp2D8Upj1CPK79YUwtdwYSVrl7R8EGdZax+LTTtEatE
 ALWCZHn6Im5F5Rjm8awE7wRLrfwRexuLvDd7miJFC/NrRBDMFvCNrVChpJK1IoZHEgx9gM1jj1X
 1gmwgTEQttLvDwdEEWfg0FZDQXCA+crOLPwce8/X5+szKoCtcZU50RImHtl3paqgMWNCk6dLAVd
 0ens8/1HFRRoRjoM1N6J0zykiB+Hq1VRwtSFKlsiEpMUoV4O5aE1LIDiuI++OkodX9BhIiFpYBd
 oQhA00lMNHuxuTi5khcF6I4+UhlvWchyir5Qa9DuFLkCY7vjtQwNvSO5izvOkZvQLEm+xHcCy/+
 iopO9pCXaZ+/TSgIMIQ==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096b23 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=G2hE9K5e46DFt30MATkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JpIDoVRh9IZmjK0jazGyRCOZfTXPkWj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270046

On 11/27/26 12:33 PM, Zhangfei Gao wrote:
> Nord exposes System RAM in the upper DDR window starting at
> 0x8800000000, beyond the current 36-bit bus range. DMA mappings for
> pages in this window are therefore treated as unreachable and may fall
> back to SWIOTLB.
> 
> Widen ranges and dma-ranges to 40 bits so capable devices can address
> the complete DDR map. Devices with narrower address limits must
> constrain their DMA masks individually.
> 
> Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
