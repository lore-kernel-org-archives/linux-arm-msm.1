Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228420;
	b=g9xDVSHk3Dy6b5HNTuBqSODJeab5Pe3lQ9PtSxcguNiAAT9wybkyeIt/DeXBHWdVDG1T
	 RF9l5l6IxXa/fhHFduHMwpZF8mGdrm2EFcvGQKMAeMmSYrWAXYGALCUyxWEJpaNS4M0sz
	 0sxJLOjyIQyyPW8nRkj5oGetHrgwUTDn5XJzK+Yh30VrRCCeQ6uXG9x1neW4g8BvP9YLn
	 jvJKUja/KbC3TXCXsVz1Fav1Kl65Hzk7oVcpZf1PctPOT0tApU5j3wnstd09Qg4pwSUHS
	 3YZhorWASiGiyPEyq5djwT0pr2pew/MD1r4T67FSCM1W2/HuIWzjX5c1TJRHB8Hb27A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
	b=Vm52lNYSNQuM9WnNMTWAcjE5hUwMHS49INzOmZ+99Hh8iS1ssRmvYpgPfnlJEDfx3Ppd
	 tGoSMyWXn/XVbsK0TlIiVb8PussV6q/j5IXx7xBWSnio83B8bew6B21tXEuErv01Ebead
	 AgqKYdYGQebmrxCtwbj1phIPFhhgMWYessbhIRWXtTM1n15+lHlEwB9nsFZhFez2e493S
	 9u/Oa/E+4ymnHs152LbL0qR6rhA0zaOVOllImmTjy2qMIgpunTqG3QqHYaA5BVWOXBX0T
	 5bFSgN8whW6p2KgUs4FIynJqRl0T4Us6nAKbmTMTOhXz0Dy8tOt1s5xw2Fa54lp47Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qz1Ad6Fi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXb3p+EM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F6606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 12:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD0F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qz1Ad6Fi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXb3p+EM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9BVUra3368324
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mEue+rSQb3nzOUHKOMWWZHCV
	p8uvI1D8kOmCoL2tqFA=; b=Qz1Ad6FidVrJ8nbK9hpcuyv9fQlFmF3jlggJ2kOM
	AOms8H7tNY313Zy9y4qWstid0cyX7p31yTGEIpZ6PIhiKe0cu0flg3Me5XqHOx7I
	B3odHkHaDOMOnOnoq66TcOnzMUGHwmcp7ABZvBiRy15iU/+agzdsAK/DNMzGXks9
	UYFqRcpQPXkfpxpghInvlSCLWbi0D/xKbB54fk0+cs+7HAJPQew0SzhHYdK6YCO0
	JRF+vk/Vg3hphgYcEEM0nmbw6uwY07GON3WE9jKzrVlCqOCR49tdkqffbWjFAkzF
	cdbXhGgENAk6uYDIMnH3NkQxcFH2VVFHQHuCD/D6M93EBw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj87s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 12:46:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece3cd5a00so709947e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 04:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228418; x=1794833218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
        b=gXb3p+EMOx0yPrhe0iwTxJC4dCdRLQKh2RIMhQyQbQHx8YhC9VeZpRCknJMJX/UIs7
         UHbXWUhAT0RHNha+J7cbLILcx0ORU6U1ta7SF553ooISXMgWNyc84/fmfPuffiLolVhY
         1ljUC8q49SSAEi2eZeRdsrWQe8Avmhr+7etXb9o4PRjZSVVt0sygoDnqggQC9N84kuJc
         nzstmcN34oD++PdvzeULqm+XV+V+tM5ABjPl9sOMegdfzFSspMvFsfxtWoiiommqynAz
         lrlAckVgFpTMe0Q2fwhZ3REaDMYRcJXLRkr+0BKNbwUpwD75zMlonLEhFWCQCiVCTw8O
         O6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228418; x=1794833218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEue+rSQb3nzOUHKOMWWZHCVp8uvI1D8kOmCoL2tqFA=;
        b=0i6YKezMlOgiPbPyZB+1aI9I8qKrI2GDRucDAqRyjBulwleYOWkcExdrdtoNecPIcR
         CHcbhTjGEcfkzjcySt9v9hm7BuyNiU3TR3D49/pC1bNovQqUhHrJnvWRY6qV4N2qxsdp
         QGchbL05XvE3Cw4OX3cHG2dxjxtbNXmCmgoYkUoRia9ekIjsXPJsnRx4BxqFlnqS6xpQ
         xaRnVrD5a/MgO+2qapsKRB+e+fqcS4kATtjDCcT4u2XIVwYVpsDvRky20gYcqcDzOJhi
         HwqGg9KpRh3iN0H2o+KYglGbifPBvspcGQGfRlV4/F+m1JL7y/dlL708LxKVypweMxfT
         tVsw==
X-Forwarded-Encrypted: i=1; AL+hErE7nIzsmDl6qjjsySAGlnG5eU4pctCxUIF5JI0QUsPWLwTokZfvpSIvkBB3F8iLXLAG3RdL30b5ajCBsQvs@vger.kernel.org
X-Gm-Message-State: APuU4Z8NsnUO3MLf5QQElg1F7Mds/qHPtwD2xycw4Cb3O6WKmaGeJEYJ
	UoaNwFOSNbPUib162Xx3sUT73LbIDEDe9gSaN0kfsFYaD20BHXD8IBxgkXoOUhNF7gEF05/k0+G
	GVgVhatvJ0zrBmQJOcbsl9v5hMACLYUGPo8UxuUAwXd0wc74sSS5RIIECcs/8uEfYa27ANnoKiS
	Zt
X-Gm-Gg: AYBFou3CClu+T+qORf0kdNnR37d46wwFq9iMkmpa1LZHseYk6Tvn0YIHESog1ShrA9i
	WaiwqlMio8ybRsbYo0b3PQkSafAIW0A6hIVn4n0LpRmod+Dgt7oL73CbwCQekI6Bt08AXR/E7Dk
	8rtTHBGaf02n/pewv5itFXxbhcjITuYbzSYgE2xnAl85hl+tlIUqjZyA317Q+O2Dkq4CK4uzab0
	O/ghLkUpuZFQ3vDbfZATiq/+WCS3rrh0f9JvQK3ZGyezc1ooOUsh01HdJqm/bbK2FB9iBfToPji
	FNRvqbiRngoHLI4KXLpA59wgxKWnA6nnRV6d39JTgXwKzjTHqavFYzuvE0jWskWR/peQkGtjv/t
	WelmoIRjCBjc9FaGdRoid0BSvFrxXpZL6l7XADtblwRhSBPFojcm9cAnY1bUbFRY=
X-Received: by 2002:a05:6102:6449:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d2db2b0ab4mr1094386137.28.1794228418016;
        Mon, 09 Nov 2026 04:46:58 -0800 (PST)
X-Received: by 2002:a05:6102:6449:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d2db2b0ab4mr1094372137.28.1794228417406;
        Mon, 09 Nov 2026 04:46:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm539537045e9.3.2026.11.09.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:46:56 -0800 (PST)
Date: Mon, 9 Nov 2026 14:46:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: sdm845-google: Move panel
 pins into common
Message-ID: <6hk3vbvxybzrsb3nli6ysdabeb3npcu3ejozhz4aerxaytjjqu@dfqjpnufsa3t>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-9-87dd4ec4f7cc@ixit.cz>
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
In-Reply-To: <20261108-crosshatch-panel-v3-9-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-GUID: x6_7NmIABHuR1kr5AcnyxoPQNog3_0GS
X-Proofpoint-ORIG-GUID: x6_7NmIABHuR1kr5AcnyxoPQNog3_0GS
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1c0c3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jgMgYrHaTVL-YdunLg4A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX51FCRGvprL0f
 7hXM0z6CkiR9mThSvoF6BRM6C2n8yDcbkwM+4uYtWa/xz0eM+jXfj9grZZMRhZn+YL4TO9SpRFx
 0rvlydtG/njIpCu7/bqZ/eOUnregwH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX9Ve5hoDqDPOk
 1A3PBpc37flxGlK7q1257Y32lg3COKQToN4kJSAmziLmJormESJuHtsSSNct8NQ3KV9Cn10eB5M
 bhoGFgR6vWW2f1bqjfzMQr25eW3Kl31J8onExiv3w6B8Sy0MrQ8F+Ew9NG43K6ExNY6vewP1bKW
 9LpBO/9hwvGeIcx2KepF1Uu+/mEqqiRX/q+ayDK3AqvjA/QJhhkl4yODIxTQRE2s8LSANrfrgBC
 acbPVxA0udktJsK5OF6qvIvF/HfbiWCAA0N9N6nj3+YVDRqadTeE7/dXbp9vb+Q6UtxqbNp729/
 PTJfLVIjlFZsiBIKMoilhjv0qXIagSYkz2+b1QLyJgP59GAk8uGWTOs0j3D5pZVHKLH0q2xKln7
 LKq1VY9cvSxZ6o3UMrb+x7oO9IK74vmu80yhZb68ZZYoCU7uRWE2sDsyz+V2uB1VLfs9WDD/FIJ
 wzjLoLzGnYvlHXMkwxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090050

On 26-11-08 12:32:30, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both devices share the pinctrl configuration.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
