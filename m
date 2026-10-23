Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762806;
	b=S33IUTjYqCh0vj3WT1Osc7+djRb5MyvAe9cZNF4LKOcmcQY7DTb/B4dHy/UtT08mcUbe
	 gxhVnbFbA8PDk+aQPI/uAzgfg3c3Dk3yI7r0wyI3YlZfYoBpzBLeYHqQA5l1P4BK+YqNc
	 AcdCO0vYNTuI3BW1s9dvzBP7Aitsy/bEOjSPMOsWenBBs+/xG7gm5XleiYeDmqkzL1oRH
	 qfNDBD+3GJPWgdKVdbBvVEUyTnv0gFE82aj+ebb6ZIJpL0dgAOMLcrB0CF2nAVGx2mFWf
	 Ao6Oa+0ednRUYoj5Fu6jt3ZSM9i4qy5HN6SOxD7vW5jQLrOXwQjGKgBMkIMJPlk/68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=;
	b=po4eUx2Nzqgk/rQ5lvOTESadsjT0M3dLR7CcNqpXMFgMquqdGQdFn8wlgUmymYps8REt
	 4x1N2s8Sat0YqDtFt1Dyxad/DPqq4oVe/TPfQA6MyDdX02IE8JUuAprzJorwMeE1QeFqG
	 9DW88HCU/2wUwOJ2xEdnBDxaHsPuwjy8++UQ5jiSaNstQXQ0uihni0XgWT3QIkEF8cWni
	 Ymr3w2HOYcQxGgTzVCVJCoSpyFg5VT3ZipHIpN14tJFp3qJCVF5h14MvCiP5gvlDkIp9H
	 1EgX4/fFhPYOEWYeqA36ri/FcPFY+Z7aaO2vZeEzWRvaMNasbP/sOnjE/kuvQTcfUSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TxMJRzQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ys2NstjC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3F6606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3F6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TxMJRzQF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ys2NstjC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZIX2509093
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OZyxso0AaOeFf5p2y8usJ5
	/jhDO/hkU7VHpqvGOj+GY=; b=TxMJRzQFENnrmyB7Yhrx6phI9seAwH/ZWkk/zL
	m3JhXHMBTBuHKWQCFqQ1XwuYZPl/aa8Y+DUfshW5F/4x6zs81QYipC47HPnOnLro
	+k1/Usl1eM7AqiOajLBIzdK6PL1yEOg/TAcxkJd/CW/+Ub4zmjwdi1ILDInOtAfy
	OZ4e5aN/sDqO2nBuwNNQaHXFUfteZa+gentyUGltaWOQ72I2KFYQyrgfWxk+JiSI
	QVNhMYXo73yJJfX5wxQL8Hro7y8/algrrlMcC+18zijhH+Rl5djaRYzvLGX52Ct0
	bDjrYmKbjPE6QyfFNym9APk/WWS6M1jns74rWqd00WDqWJIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbagb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so167513085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762804; x=1793367604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=;
        b=Ys2NstjCY00iumdWJBkgIS6iUUMEdsDdSwaYPoGNna7yKU8KX56B9w/iAhCWB/FQDV
         +d0QFEDt8fjiiCs1pHHZglEhrw5mVoCTS3/EsombLD/jAKtck7AkBHTEkdDUMaTuXhbC
         UzL07+co9SjwIIieJJB9RGl9qzsnGEyYHW1SWi1LdXNOBnCzVYp29J8KftWAODTcMfuv
         unfjki8rFFFJ55PeH416WUMZMgm641txbMDCL4y7htr0q8QW02pHSglhZGuYsiLpOpys
         tofIKpC681slY+vRcZgM9NZjqM2iOAhulZLogWN9/kMt6IJaMGpQ1WlkgeohGO4aeiWU
         E/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762804; x=1793367604;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZyxso0AaOeFf5p2y8usJ5/jhDO/hkU7VHpqvGOj+GY=;
        b=g3jkXOa/rtqrQ+V3/dALBBd7qs6EUn5SiohkcswyENvT3ybnqx/YK/+Mc8uaNniTbh
         iixlD2NCwJW+ziumWVqVkRa+GwPlWX+ReQE5VdThOgXpGNmLbfdoLpZEgAQlbDBzj9zj
         iRD4DCN+noW/s9imndT2CpbogKxo0hCzYxvvJdy1RDS6rv09KJGMHIfK8k8Izm/cV5Ru
         L1vJxn6bJY8sAlf6xORwowzmRYuM+ZqbNh2VSgsIlkRZkAjHT+qzLMystL1j0/aKXXm/
         G+WcLd8sLmJPrbHAr6wnBbyNPESU6EfKPFF08scw5EbC2WrmHY79hHThlZ+VeDZSzoBx
         znhw==
X-Forwarded-Encrypted: i=1; AKwUvBz4UYSER2jU97edfwhoNq2NeKdSG7eOJgOM3WkSVQ7G3K9iLVwn7engpOrijI13XJ0Gtx2fgODqqkf2N4O0@vger.kernel.org
X-Gm-Message-State: AFq9FYICFl7WifJEfRPLqw3K3TsIWUWnPzyqz0i1t8pX9ao3i2+ii7X7
	hsWVqvXrvt4SvCQDUh9pWIoCoZP0rgFofr+Z7vCR2Me2I9pAGJE3CYnQeWLwzYK6W4v97IdPMzM
	70t1p69MzFJvu0f/yX8j5rV+pR30d36rZuKcXgbN6wAN2zoTSek6b92sf+Z2o6brhVJuG
X-Gm-Gg: AYBFou2igOSmH5uIo8w6YWZwj2nF0hxQaL/bUHRwvFDyJ8MIzkiTDocrueNv97G+/pm
	ps1a2zYqFnp/MNgLvg7Kw7q/8Fv644HRu1GOkK5ShL4KwQRtoZn2ptF+2D2SbFGoa086//04EcG
	Qx6iScanndcd+WgZJU1Qt5lD9MmeBnuLJWYVVKjjSpsFdGESa95mVAFbAy0TkJXp5ETRVSuOGbE
	HI+RxdVbjOH0M43NQoyyFz2Glbq1oNSNN8llThSh8gc+KOK243iF1nfo4S/1JdjiT6GX9z7IjIk
	fEseRACnki8yTls4o2diWTKvfdrj3omFqWqjoDieSWKke26omHpgOh5ZfhxcssRWMwIPKHuDJTC
	JT24QJdEggUuh1y4IeXOqzYPf4ZWfSsK6ANqU2SLD0TTJrPLPuupbz3CBt7V1BO9f5KiCqXpPBk
	ZIuqotgoX4v9MY
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr860055085a.0.1792762803612;
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr860049585a.0.1792762803079;
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/9] drm: handle IRQ_HPD events correctly
Date: Fri, 23 Oct 2026 16:39:40 +0300
Message-Id: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxj22oC/3XPTU7DMBAF4KtUXuNqPHbspivugVj4Z0yMaNLGa
 QSqcnecImhFmo2lJ42/eXNhmfpEme03F9bTmHLq2hLM04b5xrZvxFMomSGgBiUUb46Bp/7EaaR
 2yJwMOg9G2yoKVj4de4rp8wq+vP7kfHbv5IdZmSealIeu/7puHMU894vr//goOHBhnYjCR4cOn
 7uct6ez/fDd4bAtD5t3jHinICwULIoCjJHQUE31iiLvFbFQ5KyogC4qCNGvdVE3RcNuoaiiSHA
 anZSV2pkVpbop9YOLqqLEKAIB1ODNWhf9pwhAXCh67iINWRmCtfqRMk3TN7jY0hAjAgAA
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=niEm2MZMIIMV2XZngvo1nnwS1Exvi2T37RRlW6xT5ZE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9bt5AU+fHH6Z+aKiHw/fPhrrVuZv3Nrj73RuuoW2e8Hl
 i6cz/ipk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+feDg6HjmNvhRUqsHt/l
 YgTX7Pd8kHr2/UfNWSnBPi1qa2OjlYVu57+3u180Mb3raryN7eM0nxMN1zuPHhHbpZax+l4+n4F
 i5MSo92+XH9ve452iUqPdm704Ryz+ds6dPfNUgqRkqiM9eiQT4u517zfeolTyoPAW64p79d8UDI
 LEPKqTOmKefptmHvFLyie6rvgxY9CNK8yh6032erD9u9P10dZB0sGH20eELXt5Y6/xu7dML7ytf
 GdO1D4lqOtvLijIXdCd9X5B7fkDPZGbl+6b39D7/H5+VoGG16N9vHnHuoSSJxyUt7EIiUmau7H7
 yONXt2dEeIhIT16V+r2u4l1Lw5OpLk+nXH4lOLs/9K4BAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX5kI3cJiVKdGf
 tSzVQ2mxJHVA1+mFYQ2p9gtbXqheome6R4OVi5fISXOZlfhZaUys0xFZxIj0//J9gYdSm9+7Hfu
 3BCHgqx4xq9vPbiO/uZNjKci/LrpgQ292KebGWomftLdrwSZnC7gSeNyH1sjle6ebfcu00gQrYW
 FJ6vYyCZahKkDjpeILUGkJ+WHQNfE0gJ3AnqTGGAsniYFWDt9S09+DQDfbxrUaqusoscVsUOECy
 T10uduxqzEEIy7Vuokv2a16A52MrXFk1lCRla2jMSyKz+0BF0k7LtlPorBRWewBg3SmAMqjCB59
 w9nyzVwifVIIyYH34azIesb0ZIfe5VOAyieV4r7DMKJHKkWppkAVbl1/UHqo7Mm6Oyvy5VELeb/
 28GNJECjjzuEBDGzhpJaSHS+GckuxRxwfewOOpdE+wIpPMgdFadHV10Ndo9/Vi2lZ2R6yg8nZnF
 a5tkdOyzkrBzSoy6zkw==
X-Proofpoint-ORIG-GUID: HGLwX9TjJS9PZoUItFKMUCz9r_jqtZsY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX5KMsiQ16m8OJ
 1F1UafA5ipOd3wPcSKMrPd50FWuhsMa/si5RujLYu3h8nFAm9nsJPZyGW5K8/hTF2JETyiJdmpv
 7bPsoGrYFsXi2zMRHKdOUwedGvDruRk=
X-Proofpoint-GUID: HGLwX9TjJS9PZoUItFKMUCz9r_jqtZsY
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb63b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=uf6nnPeBmoxfmv3DkCAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=3gWm3jAn84ENXaBijsEo:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- Fix build error in drm/msm/dp, forgot to squash a patch
- Link to v6: https://patch.msgid.link/20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com

Changes in v6:
- Corrected indentation of args after the function rename (Chaoyi Chen)
- Reordered / rehashed patches to be more logical (Chaoyi Chen)
- Fixed build error in the OMAPDSS HDMI driver (Sashiko)
- Fixed IRQ_HPD vs PLUG interaction in drm/msm/dp (Sashiko)
- Link to v5: https://patch.msgid.link/20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com

Changes in v5:
- Renamed drm_connector_status_extra to drm_connector_dp_event (Maxime)
- Link to v4: https://patch.msgid.link/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

Changes in v4:
- Renamed drm_connector_oob_hotplug_event() to
  drm_connector_dp_oob_status() (Maxime)
- Reworked commit messages, explaining what it is about (Bjorn)
- Rearranged commits, making them a bit more logical.
- Link to v3: https://patch.msgid.link/20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com

Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Francesco Dolcini <francesco@dolcini.it>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Dmitry Baryshkov (9):
      drm/connector: report out-of-band IRQ_HPD events
      drm/connector: pass down IRQ_HPD to the drivers
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: pass extra events to the HPD callback
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm/dp: don't take extra references on multiple plug events
      drm/msm/dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                | 22 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 12 +++++++---
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 25 +++++++++++++--------
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 24 +++++++++++++++++---
 20 files changed, 158 insertions(+), 66 deletions(-)
---
base-commit: 725953d4da85cfb97a4c309fad6346b72f8529e7
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry

