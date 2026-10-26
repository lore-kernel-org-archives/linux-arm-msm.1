Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027085;
	b=ZOAN7qxKjVjNu6NCtbiIJ+MBBBYmxLsbHPkzFMv6Lub788FK7jEDIVKAIhx9LGZVOFh9
	 n8b2I8MbDONmukVtGyXCTIhOlJuLesIJXG1/PCQ3k99pKu9Dow2fpB4HBribb9IwGJlvi
	 V85i/w9l2PlwT3RNSFC46r/hbdOgYoq2/Rz6LY1GquncfLvbefMphmEToMFkAQkBbYwaF
	 0/sJ0+k67V4ugSuoA2mWN+NJlslDchH4X6mIdbKTL+TSxX37UMwe6MvDc4jHdE5GSwquD
	 NiXFuRYc4+sLHu3MnsiEl2RHGmjyBLE/UXWzB4yisPMTlwrjrv1CepjfKrX0WPkUwEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
	b=wIVG/6HF4n1OVv2SuLoH+qOxKJGfGTMPuHPUwluCZFW0JXyRC2tFEgAd4B4rHhvLAc5a
	 rElDpyQgE+/e+6nbJsjXx9FxTcW3fkQcyCDM9BUiJEqLo5a1R1nFiCxOfCIP5bUk1QGls
	 bvDv77fW2za/boGhGc/wIQ7IqcQ85du8BmBqzuqlyYgbeRX3dQYEXRhnQiPaeO1XZEinO
	 P8bY58dBLm7vul4DbEKzzhdNak3jw+RmFd8b3cfSZc4N9A/j3HyCSln6BhiMvX5fl01ax
	 PNH4Gmf3gHLvQ9Od0xjoY41ZL36NYL1EMSOmPCf47aryaeXunAIyMPrp33RIA8SK3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2u2SlEZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41941606A324
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41941606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2u2SlEZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvjaS4098789
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcaOJI2AGlsc/iw3sTAv3zZN
	ex+qopC3DMZYd+jAZ68=; b=Wp+k3qrIh+YaEOH3QJzYJFTiZ7PA6rrOlmzaK3Om
	g0UQtEA9Q2m329GTlC66MyOtkGxhNan8rDYhGD29qFbh3ruypWMjsWZkeB7N4V25
	PVDGMXx2FRX7zkhbe8g03lJrugJOSeokhLe+NQBkLkKWvh6ZTmhF7FVg3oz15MSe
	s4rzCO9TKJi4nRt5HmUeuZ0tN6IDkXvxQuJo4rmVXIu9B2t9f8HzvWqepL8RoPto
	DKIgDkFd4WL6Tpxvo9UD7qZ+fgYSJgdY2NTb/3SDs4Fl3wdAx9GD+VF+JXynZlfz
	97b/FgepqeH7Za/Ssajp0IW3600ju/57XVxoaytBKsXkCg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s915wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso2906670137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027083; x=1793631883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=O2u2SlEZTVjgLlyWLx9T97J0pvTSYnM8SobCQvNT0Y1paYo2oDLy286BoAxJ6UM+zX
         pYu6qGs0b+Y13GaQkgTPPCQuM87AgeVWDtbfWw7iuwuNfQ3GEpQoeD7qPmyPkP3W3Krp
         ERefO047V7/oiXU2lrYqrdje2HmFk26xqzi333eNWw2srDYDwROBfktE5QjzBkysiGz9
         mUP8PQVDtgS6sEU9rW4UauAC0dWjnFoFeXHR/eOvzQ41dgTyKeYRSONSscprtmt5+jyw
         AEUjMNyFOn2W7Rc5sTV7o/lgpDBvI0I9wkTYqNXRS4iuMZX5UsNI9IoZrWnuQRFo5ayv
         jFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027083; x=1793631883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=HsFLt5r5nulyBSSRihkLcEBYw7XkW4QAkZe2Bv0ryl0bdMXPNck/jQkR/rX+aK103G
         ib0STRL759Pnoq3WeVW8uPVmODYiW3TyaF1f5dgAtxle+eXpyUq/erpvHfw8OsKHaQMy
         3FiLjDucdZKQbTeZB4PsZHDjeAoyJDmmGzy5hzG9EJIdw2aE5flytQUpXoFWAQ1eAu+a
         xsodIcER4oRDBAkuIES6Z+lhn/q3SMS77rctwJp9ypDJtQFYFaJWhCmRZdQMMf7NHhxX
         GjBxesDFcjNDLoAYARq96A9UOpPDMPnN4iz7LiPhM2M4OvM5KhvlRfbXuvujGA+zv74P
         kUrg==
X-Forwarded-Encrypted: i=1; AKwUvBx7+VbAeK33m6XxjaOI1evVAfgS0o3mP9QDjTCM/D6J+LKxiLEM9j723Xvm9jY+vvVvVZ+WXxBlqp74ldat@vger.kernel.org
X-Gm-Message-State: AFq9FYI3dfl4r0GmdIzHE8COSgT8alpbQ4XvtN+g7oamFdutbZwrFFSh
	LZPhTHj7Oho4i0Kp6oclN/EvkNcYvP8ieLsSCxDpaFDuDvnADg3s2c85s729+STY9uVqzcK7UGf
	JF0UzmHLA9yvAi2o2DbgBRQvrIVPTsT9wfTflOtEm8xedqZKhwnWG7AB8DQZJ2kiBA0hf
X-Gm-Gg: AYBFou3XbTjwqd38XRX9kOOtoONQ7S2cOdbgJMqras8Y9Drp4WaL5FZ+kLKBY8Eh8Lw
	GgY1C5XfpTvnsTTkYil0ys+Gep3fjtNUhJ1DmoROybEPsmtDe9v7a7kT3iE11R06EKU3JXcB5fp
	F86xL/BUqb+VNEAQl6UM78ufwODOUS6CPe+Cceq7oeDJh/lKFA8Yww9evFFdU+hMoqvKzrZjIwr
	Kh1h5z+w48z47pjmSvJOlTMlR3y+oZ0V7POJmdpm+/D993QobEztysamYp56IsWCoBmRSsBM+yR
	0jgeb/YHyu4BO3v4n9qXdvHO3HQWtOquN3oYIL4XAVATH76zVlkQ/Dpdk682rS5QA+I+uYrr46b
	z3OsbjUO7Cmn1/adh
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188348137.13.1793027082054;
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188337137.13.1793027081345;
        Mon, 26 Oct 2026 08:04:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm200370845e9.8.2026.10.26.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:04:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:04:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
Message-ID: <2zv6vf3kvlb2k5oopypae6fby72ykqyg4pb7mgiomzyptolez3@namz2jhghdgz>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX98idaWO75uyJ
 ojVdN5Ep2/h6yURLB0zzH+JwK3Vjb+3/Hse088KJx4bw8GYe2ZjtNYV7Q5g5tcY0mah3zFtKljJ
 OxWD1zIaj0HxCLT7OBxSJTKENVre6KCQtZSe4Ui+1Lmjra9nus9CbKagIb+LaBhh1Jjs06Ybdvo
 PAK8/v+hYZWEKvfw+/aKzolNN3CdSaKH49L6MCe5NDLS5NmwMP3vP9nYqz3O6tyA0OzD7x/MPRZ
 qF/MnU6L+ZusePBxBzajAcDFZimVi33dz6EYDJiI8nuveE4JGnkx0RfX648jwiZjgVXEJAGakOd
 RsaoPTPpRwJZIPON6PsKrn0/rnNcbz86x4hLgXnU0tesQzoDcqShEUq+zzEUoIK2swPZG+tfCTe
 7GF9qWrC/odoB1z5WRUsvFEC4H2fekAUdGj6WuI3dYI8pVDk7pX5Errhm+sBKnqO+TCoVIuoKRq
 DuYAoMOMGEUt9E1UNHQ==
X-Proofpoint-ORIG-GUID: nH4nZn4Kqb3gHQhWvmhadtYEtA1dZgpc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX3CFkhDWDjh4u
 uGlTvKVc1wNgZUJipmimo790wXT5YTHisWbqfPk9znCnayJAi1r5HghI7JCc5Srvde9WQfAOW3i
 4wT7JDc+T0a6TLGZ+nrsGaoBfumm+ok=
X-Proofpoint-GUID: nH4nZn4Kqb3gHQhWvmhadtYEtA1dZgpc
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf6c0b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=X4WHrBvVKYo2O6Nn5h4A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260059

On 26-10-26 16:59:30, Taniya Das wrote:
> Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
> requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
> GP_MND select the supported PDM source clock rates.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
