Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C5942FCAF
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343520; cv=none; b=IZu4mVKu4uK9calhKGKWIH++6w2//8n4b0OxMHita+oRvdXJ4dNjQbCia0zXp/AEiZ4tmLC4jfSMZHg+jEwr5lL3fDEWydtlkgLQuCI8aSYiEyv+iawat9De6W5KS/Egjj2sqeD7eZnkgATh5ISZQr3hnDnZHYTAPBTKcQ5Djjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343520; c=relaxed/simple;
	bh=fGO4RplatNuXpDwpIkS3PIxnYbi9rKjtyM7If6v8PbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yi/10yoxopPZ2afzP9o2yd6juT0J/swFgb9J+Jiqi/+Egr8wUeFelWmWQLHZc89se2V7uD+GOEGGZwP0DxAVv6F7p2h61GQC+HK7ZGbrqLjDR1URePL1BGKKXCZLh1byh69l3uUbdsXkrdUVPyX7J4iCMyrN6Bd3eP1fTNISffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tqv0yeIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9U4a0Vo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tqv0yeIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9U4a0Vo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NDU1463848
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UObzRMWFCbP75V/KjEzbft/x3L2cCcud32HQTacNGec=; b=Tqv0yeIiPRwmmsaR
	Pw11uZO2np9Mq/XrQw83Pq+4k4Eaey5F9mjwJ8rnWt0AxtNGDL//z6vG9eIJayLa
	qCIdSGLrHuv+NsmMaJKOoEFyrfg9zqNeCFPlLVTcfZtc1OA06Yc0x9ammn4AfrOT
	LJjvcqP3iqjBHrYYZaBED+b9/3n6+zvvgstSgE9NsPa74SatqHt5VJjtnQwSFJwi
	tpFN1ox3O46aRGygmArWcPK4frSKk1anxGM+S2PwBPlQh5+XRt3d8IgINo1xoxXK
	qjFz4EWj6iAcq/zaNIfb6BGTKPliIekVaA2V7o8cTCQgYb4mat/cAKLQPuHs3GN1
	0JvExA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k3bsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:05:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1101343a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788343518; x=1788948318; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UObzRMWFCbP75V/KjEzbft/x3L2cCcud32HQTacNGec=;
        b=a9U4a0VorLxR7r96Tohbt/wNBKzYKhNbw47uReDL2CXE21gmvnNXw3sh3dlfPqociK
         L4xN8YuVDYnIoh9K6D/QZpLwQ4fOxCZhcAyZYrE1fkbUsw/eSFyEqv6Pxj+NqPcqLQ/W
         LZeqeRTN/SeSy/6mbvcCErFcsSd//KqZF+qoQsSLrxOltlm9n70ECvPWyGhwVVJWuo5S
         G5ZrrUxp9qVi9u1CY3Rybgy12/eWRSLBXScU2uh9+hFHbuM/NPvqM5u19LKE6ZsAcKXs
         cgFxd2PlXKwhz91e97CV+biZM2/dcFJsuMBWsSHekgqaSam6huNvpTIQsQ8LLUFw+bDJ
         LJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343518; x=1788948318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UObzRMWFCbP75V/KjEzbft/x3L2cCcud32HQTacNGec=;
        b=cF1SeHaie4ZzxUad4FU1+uYIdEObm/3UCl07HI/F8UH/IVLM4v3vyPSaRJJAe8jRcG
         KUr/M91kV2OnTv+zxMaB4fzfc1mB8sy6+4nhIT3tImmmyWb6mo9itUqTFfzVf+pt2pmL
         cHVZQctg4QCHS1ghuvk111ITcDDQlTxAA+4UAmlL4CAWX3q7KH44R3IZmYBIc2dhZqtN
         hsKZxY5dFTMFDzv7sAeBv/H3Dlf+8esdDlMAhwasNjHPK2QJ7UkzW851FSyAzmbS45fI
         Z+lI/nSlic2auXO80/HeSJjBK3WTyI0ge9GIOCRS7RXJw1YwgbeRuWuT2YeNI83nRbUz
         LCMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWahnpCeeAw9dmiYgtAlb594HE6UsEs+pnVUFsxYFCCmBR+WAQ5yIUIi10uQNQwLJDhTbJwkwG6YcPFsYw@vger.kernel.org
X-Gm-Message-State: AFuF++mQ8jW7Hwm1tAZuoNX+dJ5dYsd+Vy3H6sPxtPKlCCraVVJhPO4o
	3rugq8DtUXiebyW/9K7IgPR1l0broa3XOhBN2lVyYaVCq+D1f/uEfCUBwyDb6SbZPO5ZGstUcE7
	Tk4PDuPKQztGjNwG4CUUieW/Nxjz8fU1TiWCjPpUy1+1JL2SlA0coDMAF7QoHNaLYe3c4
X-Gm-Gg: AYBFou0ko1v49MgrM00E9z4A/DkVZ0Slgs+3qkQzlnhO8pgKVJ4+jnGGpXFEawrmCbw
	/qrpynx4zV+l3h4JVGKGMj9lPTWaPYfRlm8B0o0hgnjef2Rnqn2RkCo15wqqxqCFodEY20x3Gf2
	NpWMEoAPTlyzzA22K9oR7s3hdBdREAmJfeIYSc4cIZG0/9H7ozPBkzNM+qHXzasr6NHmoDN0Dvd
	GNY/qzuLHC8GLZAE64gpMCxCPflaEir/+iTR9R4qnEXFcF9OkfS0z/z9VJN9VGNGJijKH03xJRe
	S9h4BGW3wsp6FhLB71EGrqaamD0u+sHw2qExMwGsbsTr9RWK0nZarcxFNd1tHEw0NW4Y9u9Z+yk
	RRBYTyHTPAwDKrt+jlU0WiJfNC8NffOoC7WRv8SXU080=
X-Received: by 2002:a17:90b:28cd:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39aee0e6633mr5456125a91.16.1788343517801;
        Wed, 02 Sep 2026 03:05:17 -0700 (PDT)
X-Received: by 2002:a17:90b:28cd:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39aee0e6633mr5456020a91.16.1788343517229;
        Wed, 02 Sep 2026 03:05:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430eafc907sm5093202c88.9.2026.09.02.03.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:16 -0700 (PDT)
Date: Wed, 2 Sep 2026 18:05:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
Message-ID: <apf01nNGO-7E86J4@QCOM-aGQu4IUr3Y>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
 <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
 <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
 <CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4OCBTYWx0ZWRfXxCEcXIaHhJ8N
 JkDvO0k2echw1So51aU7y86KkMly/DH8d6R+cXa5yt1zhcXTUzDe97zm+OQkEvj4gFmI965co/3
 diLDo1qF3yTHTJdpSNN4y/rJXm3Lhba/sjHEpf1eWGXTt87fN0AkoUVANf/M7r4rL4wRE+Ik+Q3
 Lk6KemDCNTJpvvMpP8k1GI+KFTSQoWg8pnmb5h5jPLy7tBVTKX2fLGkHZZNffQWj2QDHCG3ikP/
 7ETWQl+g/SPV9HNxC9suq0ixDcCXf3nkfV+IZHO58TuzkTS3anrn5dkwnRUKkrggaypyU+suuPf
 2+59Z+5wSnYWiwOo6LxY9Grd8EN5Thay5h3cKZMjRVQu5XifWGcnrVQbTTD2lEzWFPEi36GH+sK
 Sg7kF3e1rSUj+cOJ7P6W+gTozeVhmAfwFiLP2MlBhMPRN8VWZs3ulqpfP5biyaU/b8ts1K80/ex
 CamOTSCDfwWXSTJlTkw==
X-Proofpoint-GUID: xQj51R4dBQ5THNrcsPEVgbuq71Vou8P8
X-Proofpoint-ORIG-GUID: xQj51R4dBQ5THNrcsPEVgbuq71Vou8P8
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a97f4de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dbI9BitF8MENLqa2HooA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4OCBTYWx0ZWRfX9V9I7iugrhbS
 ulL5KwEp8lIvwUz98pR8WbYeMTAzmFHKBsMxjmWKa1YOO50ZW6h8V2jM4UkkHNDkL728KvfKY+g
 DOl38cz7tDnbfM/uruvUFcUYn+s3ymc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020088

On Wed, Sep 02, 2026 at 11:42:29AM +0200, Ulf Hansson wrote:
> On Wed, Sep 2, 2026 at 9:52 AM Shawn Guo <shengchao.guo@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 01, 2026 at 05:46:09PM +0200, Ulf Hansson wrote:
> > > On Wed, Aug 26, 2026 at 3:55 PM Shawn Guo
> > > <shengchao.guo@oss.qualcomm.com> wrote:
> > > >
> > > > The Nord CDSP subsystems do not take their memory rail from the shared
> > > > MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> > > > resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> > > > power domain table.
> > > >
> > > > Changes for v2:
> > > > - Drop remoteproc changes since "mx" of remoteproc is just the name of
> > > >   memory rail input which can be wired up to NMXC power domain in DT
> > > > - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengchao.guo@oss.qualcomm.com/
> > > >
> > > > Anurag Pateriya (2):
> > > >   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
> > > >   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
> > > >
> > > >  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
> > > >  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
> > > >  2 files changed, 7 insertions(+)
> > > >
> > >
> > > Applied for next, thanks!
> >
> > Thank you, Ulf!
> >
> > Could you maintain a immutable branch for qcom,rpmhpd.h patch? I have
> > dependant DTS patches planned, so an immutable branch would help Bjorn
> > to resolve the dependency.
> 
> I am always applying the updated dt bindings to an immutable branch
> called dt. Allowing SoC maintainers to pull it in, for the purpose
> that you just described.

Awesome! Thank you Uffe!

Shawn
