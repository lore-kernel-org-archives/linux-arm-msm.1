Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615330;
	b=J/ndlyaiAXg6wiNf8CctRrDfiKraUIy8yhJZcNs1hXm0NB501TPKL0afgbsYqtgJv4KS
	 2xasMdSPkHPhaegiINxRVyCJeoT9IfuWTTdPoYbZ6cGEMY4ney2zYqV4y2lQ5FXjG+Ckh
	 4YI6h3ec8KR/lfiXTFxAIdp7eT9IQ3lGiz50iFHxGmfNIoJgL2iMaLpFxgsb+qBjjuO4g
	 dLvzBwwvJ+ssqL2AxbwsTNd1YtBkr5ohz0PwLmBupxl/3+GB/lg88jqgllFRygiG0rtG4
	 1f/TDErOMt2l07hFpcZaATkRmi1Jvokf4tGbU6qHyzVPOGwVB2GzxNNohrAK2+a5xpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWPR9dxJ+6mYEfqzZ0xvkf12jtHOjAmnZXogzpguUXQ=;
	b=nlx/hm5bDu/bW8FmLTrapkTE1SuNq99oQXIpavl+qr9/N1Hwk5kT+uNfP0bqK2nuaUCG
	 W4d89ChtVaVnpJIiSWtXmEnoQA97KZ0rVDR6kiVzsXFuJdyx0aBhwKHGKmZcs60vEQd48
	 lGt4oc43JzFuWayy8lV25awXVgMtskQi/SU6xXEF2M6sorLAe2QLi7Dij7f1sJzYrRvJy
	 pPKl3yKZglFvYi+kBoOKvfEzD9peOr1A8M6tldetoAXG6u09t185qBYB8IMDamtZdTW8t
	 E0OGjR02oy/aruUxh5he5ueWjtjhqBYo5b2NY8UGh7ViRhGe6DjWLFrjPmBM7rsU1vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0npo413;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmPs3zLw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B74606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B74606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0npo413;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmPs3zLw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A24C3402655
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GWPR9dxJ+6mYEfqzZ0xvkf12
	jtHOjAmnZXogzpguUXQ=; b=A0npo413P0imsetLspBjs262CH8BXVYjcjpv4jk3
	Dg8z3cG02zDKBgSC/kTP1WukPF9rJwzzVP5q0lGoGHPV1qit9zluSZkg3IhlVqSk
	DM+qrXx9XX418xuZsaGUxf1tvpB+E+jDoVL/2AdOeWjwentbj+xRJtajk/jdFZBD
	Es/FJwn7cdJf0SlOR7xuqrtUNuX/T9FM+6deYmjK6VyQCBi7MHzyPprP5UZVUp8K
	FINF5rjZ300Xy+O20HgvCDAcoWhtZpf/VguhYL6yEGJO+zUsvkCxw0w11MPXyNhe
	dr5AAHvPbJBRlL2iK46bOVFw/ylMjxaWHYHCjOilN8O4Hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8nk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:28:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so462436885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615328; x=1794220128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GWPR9dxJ+6mYEfqzZ0xvkf12jtHOjAmnZXogzpguUXQ=;
        b=UmPs3zLwAdyfGNhUx7St/0HCGCdeo9HV1T9c9qZcX791SCUGLuJBhj9iey9Egr2Tvp
         OThVrDAdJhcEpwf/0etF7lHGeQWuMmOaBoelnzT4uyPxwHbxXoAsX3n3H5pMDE2KbfDZ
         5wmGmIfq21q9CzKPmCmJvDcSpEnn6jNaZjE7rDankhFxbC3X/QXoYPiTJYKmq6P7zIu+
         V9lAAC3vIjDP5nSKuffd2hSaqTTLKOy1Hig3fG2ksLLbcsVLlTAqlASyFB8VVBseRvjO
         bY3hGs4h1Eh93rqhBMzb+XddeOwzE9kuNIEjpuZA1bF27eZWDtwINuQZlNwQiAdzBx1q
         Mngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615328; x=1794220128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWPR9dxJ+6mYEfqzZ0xvkf12jtHOjAmnZXogzpguUXQ=;
        b=GMIK9w+j3n2fXNoRrRPxEOStH4XBPDiwUACilqOkKiRSqmtPzIqH0vzsnnoRlO1a7E
         VksX2Z8HZrU4ycWGoSEkheST/Re13yW6TtrGx1nsAV0We24BctMfwoOmbwjOx1kmesrA
         piOWP1tt73y8apstfK4guaAI3wEVrTx4VT/CMkJ3OKUbpSDLF4ZwvXpL4nYms7x/n0Mt
         rciOkg5WhaRBuFlZQngYj9kvLcZsvNn3YfBLkoQDvst72z9rYMcgXbdTxXenzgRfHOzF
         rn22RHp93vPzyxxGnlciBLPYP1gM6SnqTAgN28yLhyYz7j658LAlwwP/qXIkH7yYaYLG
         ZpcA==
X-Forwarded-Encrypted: i=1; AKwUvBwyYBc2hGlaOkAqzb7dfRniudrsmQOgCt0eIyNUQLDW7VPvFKM1dxoH2X/jUx98Xen4jgIJvHsZcfuxF9cg@vger.kernel.org
X-Gm-Message-State: AFq9FYJzy9otlAcBbo0cElKMZ8AE3+ZvG+qvOcMuSE/DZtlyz92LuyoT
	ECNZmZZ9eSIxU+oAqls/UA9JdBh84Qlbk5ztjMLO7YmVtxuIEU66o0v1gI0rxhCTKmvmDkyDNi1
	toR1YBMYHt6aRn+aWVkhuPv3GURNMV1kQdlzq5xb89OPPfnho9x4rcykzCAUQtAm66fxp
X-Gm-Gg: AYBFou03oxuUkB3l4hCLF5QmvBSAmO8epqwjgmL2qlZdACEekvMnt3xp76GlFxbETki
	bgCzJesz2rz/SuKfbLpNRYpz+5GhVzxr2YVjM4AJ+tU469MUt116pezT7QJWDqO4ZNlMwftM67G
	kHlde5m/6ROEFTLA4I9EOM3rTVQJTp7lk9hwlmdEOCq98aOttwWe3lH3SyybcQkW8if3BzOx4jB
	qUldkGxcxv97NtYC/MYW2RlYsgKpBxLCkrrHVPvYXlGL8ttWJAIlxdUn6a5LgdiP/UHkw4SMGNL
	QdghgSBe/LHEF0OvVfyrAMQ2CPziGxWHd7GuIIUpAwxpX3w+9NDQ3gp7NphmlYMmhntjpbagTN8
	ECTFUUQnp2wmw2lQ7FCfMzvac8RmOI4WLh3aXPw2s//4IDKe2f9Vwxj44Ufo/vfGBDhAVkR55Gj
	6OQvbSjus7+8KQJCTUctCD8jgYDLQc0v1CcTD3C2ntBt7pN09/KTYx2dhxENF3
X-Received: by 2002:a05:620a:2984:b0:93f:2e7e:c818 with SMTP id af79cd13be357-94421799c57mr1645331785a.59.1793615327713;
        Mon, 02 Nov 2026 02:28:47 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:93f:2e7e:c818 with SMTP id af79cd13be357-94421799c57mr1645329685a.59.1793615327296;
        Mon, 02 Nov 2026 02:28:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072194csm1649332e87.15.2026.11.02.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:28:42 -0800 (PST)
Date: Mon, 2 Nov 2026 12:28:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
Message-ID: <pa5mluujqthv2ajikpoejheure4vswtbsu5jry52ek6k3myikr@heh6mx6y2gnt>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-3-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261101174911.25184-3-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae865e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Mlro_P0Azzi2O7fenn4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXzA+v5ZMIXKH1
 LpLARSSwU77vkiw9knfRd3Pb205PiPUNoqLvh1WzFf6NhaHrRcR0DJCkq3z+vg4Sg1qNxjfmtM3
 BJ/OJLBRpwwubZa2Qx7CXphZjUAuOKZ0UqpoxVAUJ5yDSV6T4JKrN3Fjsk1uVu9Xl1bhM60QWRo
 utmtxVuvP9uPtl0WjffK7jhJcHw4O26NSFswjyFCOdEPdCgEBf4M2oqVRMGouv2wWIyBEjmT493
 euajceNn1H+KAiy9kKpRNUHA152qW2xjYFVu4c0ClwifErBi0XvjmSxhSUUelB7BQq35u05Ehjk
 Ms2oYL2oaPYy8BCj05T2q1D+Gql/jG4xLu+O2uw97t1fqs7UOW9QEnv65qTVYIHZzl4EgOzBq6M
 8kG8ne11XlmWy8VpXqLloR7FkEQxLCeorBYoT/2MGRxXeiuhUyCmKykSP4kZ7CNqm88rOOP7xhe
 00tyUtwY+QE/tPNZ5Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX+VXFo3zF9Njd
 5B+fIghKMb3KjAgnEX14SfXlrgGLQzbb7/xZRcFgpl1qQDVBUgOg9+H+IHIPdmqlbb8H+js//Dx
 FbLJP9FUc3hg7xGKg9A902AoSEuzduk=
X-Proofpoint-ORIG-GUID: x0N4kvNRDtzHBzkHLqAu32ZpzQKCcOBa
X-Proofpoint-GUID: x0N4kvNRDtzHBzkHLqAu32ZpzQKCcOBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On Sun, Nov 01, 2026 at 09:49:10AM -0800, Rob Clark wrote:
> If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
> Only the VM_BIND ioctl should be used for binding objects.
> 
> Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
