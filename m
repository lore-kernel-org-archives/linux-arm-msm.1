Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168580;
	b=u9gpGMkm+1fP2sCEP4lQkDL6ZJeCEr+WKcuaro5NkDl61eQAGXzhALdOaLbaVUh53vmJ
	 yqejRfBT3YpkylpxwFNeXrBhME9WES6kE7q8GkxAz5pg3vNWgO7COBhdY2p1todArhRnn
	 1rCsaWqmX6n7Ot3TJZgVSrlDWtLgf3ZnalicRjTWC99uDQHv6IDKJEJbZlo3KyWq1lDK3
	 nUlYSsj5xjOlz/sKtzyw/FG0UqJwzgJHSa2HZzH260pFC62iSbFKZJq9rEiIU+yoMu155
	 hCWaT9LKG/oZvVeTNgQWyFU29JmRne0+vgvxwDKKrD/ggqOQcOUmbaHYAYEJw3lldsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
	b=yA0p5cy3INQYC60U0pUP1mWj7s9WTfuH5Ue7HREhif/HTi5muZ66GRNfQs9GHOBz1juQ
	 Id9L3Rq3lrZsdJdjwmKG2ZopmjZLhFfo0zdpHg1L2zd8NaTqTktztEfPhMNTy6xdPxPrY
	 VG7RcNcUSXzvnd1byJ40oyF/z+KOxPXRM8jAtOwm0j+GlZ0mlzPqdZbQG9H8cHjsBIY+t
	 oKFcVEmufJqFSCtWvwrkkajlyMKd2dqLprWB/VY3XfoacbESSoZB2MBJMPLoSiDCDp9VE
	 cE5UdL8JpIzU/GQ+wUNDIfYN4R5btB5Y6/rmAmzA3ZddzX0ctjc25a76v03EvD8Trpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtBZuUDj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTLBdE3L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28AF606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E28AF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DtBZuUDj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTLBdE3L
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewKj605904
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=62eMXVAhsdOLajmrx/nEro/a
	U3Oy4TAFM0MOIhVJt+Q=; b=DtBZuUDjme/84lhCpowIjh4IA7DZGsYJ9xpjZP+i
	kV1Z4tp3kMmww3fOatjtqQZ38Pf/Wf7lRdvRn0KEffg8CiBaC1MIkFEjSvJft4bU
	d9J9rt6BmsRA/VPAjktQn2F7U9KwRXWz/xPgFEvwitq0Ivsqw3q64DfFNV+nnT/7
	gr7IkNBRMlm6s/mC1FczAeaLcyQV+XfhFFnKYGFqoDigURsH6GZ4/i/EfMfAZCUJ
	VxFUzpoEdz2OuyMCaofk1qJtkEElziuYtXxzSIS+HCrZT+9mA+G83IHFHMUWIzlB
	77UTAKN7z6v1TBUfM7eHSFOFeyjWERqLRkeSr07DVSPBVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrxv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:56:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so116669785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168577; x=1795773377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
        b=JTLBdE3LjVJxvkDC6Ly8UL7Fb7xbgpvu/LTV94IfDcHvJauprqlS8/iFkKoOvT9o9W
         d41A5RP0GZ00g1Mj2sUFcih48dQItsqUj3txC/IZaA4heSmP50lyiPnvYZI5Pu1ab8cw
         KCaV9FeS87aVnfb6D4vKT5T/a/++unJCg4iCACHhGfvUMTi0vl2NrgbMsT3YsBJCQSp4
         pZ6VjHaxFjrywa88Mt3O35t0gbXuvQzJIq6twUz2CI39TWxgZe25cq0rlZt4ksMtILyx
         eN2Bty8uFX+En23W1FdbNBveRLBV8QlRzcUsG+aJzuFRO+hTft9X+YVpPio5TUrjfld/
         wmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168577; x=1795773377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62eMXVAhsdOLajmrx/nEro/aU3Oy4TAFM0MOIhVJt+Q=;
        b=NMLv2mal2y+kGgjwjIGI2aWrIqdlKgHs4HGi3c/ZxivWXDiOj296e8s9PmILLv2kCF
         5gouQ7zWyh+xgFgeMVv/yl9eoVRF1p+2vyo5nAIGenKr7jDqNYtvrKeIRzO8CVLoNgMx
         QAlBl/YPyV/M89zhzjTIhAuzmjQ4o6V1zXmt9+7cI0KNuzSNbDRa8UvGyre4cghr3jSQ
         VBX7zOQUwzqyHkYpQ2wD+/+JjioMdHTj7sQL2t2JWNMAI60V9z0z1/webO7mqLMLcVwi
         Sm0Mrl3e6JWCPkia0HBDNW8l0BPiDwJLPqzNBLQwC3zTjOkrqv1jqSYvweh+ZR0jxBaH
         Fq1w==
X-Forwarded-Encrypted: i=1; AL+hErEb1ygXH/vn4hpwAiUXDUqa7tlfumSv3Pyt28oN76BqPPxtN/aLqQZ6WbDl+8+aEv8mvSQ/MXQl1zYanHr+@vger.kernel.org
X-Gm-Message-State: APuU4Z+IhHFJWOFTKom8LANzHMXONJqrh4V7SuIhktAyWSWyMrsf7Sme
	zwayc0VpifQUOmEQCl7IR3Ynf7vKdC/nHCelib/HJ39QN0knLAgN4Q0vBps3OcjTz8zjU2RGak8
	LMynjXVj8bm2lp/qB2OpYj+XhHct53LmlGlAxQO8lJa+ouegQRWc/UFcXHvz7Q5ZZb1EL
X-Gm-Gg: AYBFou3Uj78+Qz0aLKqBbiE+5fLtxQxISxwo92OtRzk+v/shbUQYKQOZKBiITSQ9fyf
	Oa8k8nPAH0mjEbJH7f4YX8PfNUHvZMIlr2pJ70SRxZAThstc2TV/dQa9Yh5NrkpKNk8j39fnjwM
	zAMbsd5faynsJkbeOzyHh75rz0tYgn6NfbzRqWXIqHKDSyaCyvDmJZz2SH7i3e8fdPNeua9/1YA
	1jVV1sgwneemdJ3zCAIr/lhAw3SrJPVIIPO0Hm2HYsGH03kBs733zOBIuWHuKN24Ze1PoZm81Yy
	Yb8bcWil89PY3CvQGhgt2T6W2iiqn7EgZmuTHNF1Fiu8CBShAd5E618S5Tc9fWLI/kZH44HPWn2
	Nv0FGw9vov9ETXi2gvgw/xs5f8LFXGZ9ndNJPlVAl0tV79m0BADeQKYHv16zqPZ8x
X-Received: by 2002:a05:620a:4693:b0:93f:2b23:481b with SMTP id af79cd13be357-949ba955b51mr440889085a.22.1795168576897;
        Fri, 20 Nov 2026 01:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:4693:b0:93f:2b23:481b with SMTP id af79cd13be357-949ba955b51mr440885085a.22.1795168576349;
        Fri, 20 Nov 2026 01:56:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm4320876f8f.26.2026.11.20.01.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:56:15 -0800 (PST)
Date: Fri, 20 Nov 2026 11:56:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: camcc-eliza: Declare icc path dependency
 for TITAN_TOP_GDSC
Message-ID: <vgclluwnmognwpaxmwazb3i6teyrktvbig3ykf74ppjbp24kze@umzxgoirryxf>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
 <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
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
In-Reply-To: <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXy5VppGmwWC2W
 +0zk4Vox7jEQHeRzUmIG+FFJu96jlZA977QHOj7F5r2tup44NiMR6dd5RnrpLhGWMoWYoDxElBZ
 A93ZwxfWu+n2kCJKCkT46x9wVDBBpFGlbmpU3Cz4IqbKLlSYdXBLk0TG1NErOINXr2II5O5crlg
 OQdDcaxdohecfMMG6FRknMHw1HMKDBO//MyyshnxuHXNIkTBKzrqzVkMThZ4gg2Ub70KWpDkNKZ
 ecrWbGN1Htlz8UcRcg8m/gM4B9qXkjvBAzOxUyl8gnsJvleHcx/TvV3QcLdM0FFDFVHo6gRVKos
 DCMuQfvqPe0CUKwaNZ52/XKlfOAYoYR9qR/v+UX2oewvxhbM54oRCjd+AFc4Vg7JyDmOFHO7ve3
 D+MtBosF7cdTbIV3LBFy874mtmoFuK5AwXxo4z5dZJgA6zWCtvMKc4RTyLOk6NBN8Fl30kKyRVi
 k13ML7nX8ZYyvc9fqZw==
X-Proofpoint-GUID: t-CUFeH5o56SapYiEoRVDI-SPykilWJt
X-Proofpoint-ORIG-GUID: t-CUFeH5o56SapYiEoRVDI-SPykilWJt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX5CrTXJ28Uve8
 OLna1cshpX15g8vL88HGFgtiYUg8imeuxQ6vITSiVOmZVaV+ggCWUJz31jMIlKbOfaUl+dpLsxP
 qBFy7TNm3v8iHjXpt+ohGElDaTRDHW4=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b001942 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cBiroVCkOlD2lhM5SNwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200039

On 26-11-18 15:45:06, Wenmeng Liu wrote:
> The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
> without any client vote while TITAN_TOP is still on, MMNOC attempts a
> power collapse while camnoc may still be active (QACTIVE high). The
> power collapse then gets stuck, and so does the MMNOC BCM, so any later
> bandwidth request through it times out in RPMh:
> 
>   Error sending AMC RPMH requests (-110)
> 
> Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
> voted for as long as the GDSC is on.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
