Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013689;
	b=0X+RJwrByxVj82qmFeXF4X2KtV1a8pfdJ+p070C1QMWyGIf317MrISJZl5I6LUDXbfZm
	 drs3zEnubPMLIhix0zW/mdW7cpZXlG5XRP3ve7YZfeTkC9tMIIWZxf0AbOlypaieS3k1a
	 Ju2EdnrgyNtHshHT2CEnbJ4+egCu6+G3NJ8cXBoxp9vMXTir+UbGIAxI5SE1WAMxEcNXs
	 V1kl6wIuc36FexhzMZAn11pIk+Z9bqlXphMwOABZtE25FHebt8JVAQ1SwlQPpXYzs2pQj
	 81PUxpBTfS/XgTayPmAx4a/3Cq0eC9CsQLpnMywa5liRb8HezSVtKHhlX6dUk5RZ1Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
	b=X9cjCdBRdoeUXTY6nfgLwXJSjtOqxeiFhSikOPZb00atiBFH8UWcOQm0zMWEJXjmAUfs
	 GSphNnQbekiV2gvW4re0I7aHNY0CfMzfCarBa8ihLaDCHJibj1tdTJYbSmN2KuRv4LiUE
	 6efCH5fGUI9ISstsQg7eaL1V/k2TZ0K6+CELpdY+viS0NL5lzBw4vVTa+WwB1RbewYl09
	 Zgl+td1bPP+AC3ESKRolj8i3H3ot03surdYQTrU/FQzt5QoHv4MDGQwtFF9RKgcSW1rRu
	 Ka9qnb8Y9Bgx3aisEiyEOBAinhMN37kEzJVnSFGvz5ZfQ/BERUqEFt5L/ba2TbQiCKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzvsnKf4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H69D9yvc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B0D606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B0D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nzvsnKf4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H69D9yvc
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mnoh71063672
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 01:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XqszqiOkBMd
	k1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=; b=nzvsnKf4vSqy5I3sIwru73tIh/C
	PkLvqXCjrNMuZRvybGPsDiFnaL+MLmf/w/+fqiny32jbJ0n+3ffI7He3VoZE1nIm
	29PLZ0FYkhyN17eFrL9/yCjtsSl1XGWQdS1FWC3kaG3uDbeRwk3oZgguz4rgdSkJ
	Qvfe8QRetKM0dosQXmVFkRuvs57K7L2i7k2bt1BwfJ4PGYOawDLko4IHgVa1HI6z
	Q3xLqlTIuzyFu6k6tJ9Br4f5AVKQ6qdLWdDzMN/dKJvGVOlzHO+GyUZYXBNIS0HA
	xls7WtflYKX4odjenNt74HqjWWYx1cT9wBrRzh/Ii2re4deua6tzZoFO8rg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv0ykm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 01:08:07 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67994010b21so2190236d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794013686; x=1794618486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=H69D9yvc7F435FJmPIi2NwpLKPr+qSEO8rDym/CA0uhzlay0uuYxDQhyay6F1nq+hc
         rEgl0DMDaV8IbmVgJe1GlqUBE1kIYML75u5f+n8q1x2qTByE8vNEY8LS1Lwurtee8L1n
         wZpnFnJB6QCJuKMPhuy6PIttocbM2EGZhvZ95r+xwgfc3efceDJrykgjO+QYxS79C/3o
         NYThuemJb4bU3PorRBZLvs53qtNXxjaaLYFe6kQYnTa3dtyskZ86nfbovA0vuGJEcWtG
         7TT47vD7C0hmOE6ZPipuRDZrDxsujvkHBHGQ9bYq+JyrRT4r7MjF9yxuodKMNtnVJQ7T
         ZEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013686; x=1794618486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=2rdm4JYrmt4gtlo95HuhVgKWErwUPbiGoy7PAdDt5BFk+M/rWdSnfTNPE9NYo5uAcd
         r7Vb8dTedTrlfaxKlXSHGhDQmaML7QGSIFFE62shb4CgfdF/L6kWR4440ulsM7glasu4
         ro91JTM5yIr2XDz5c+8b64PG1UA62qALK/I9wm37RHk0OfKmzpWk/K8fmfYfeD1d8NvG
         bbkaR0xnFWRkTiP3UrpLuL/WacR2nXkOogHKkXdkNK0Ht4CvOdIac2B0doeyDDP/L+wf
         zuydo9ICo7PPg4aWyHCcXlUB6AC6dFR3zIasolceDTfnQUrM6h0fNKLiTdM4uY4jo26Z
         Ch0g==
X-Forwarded-Encrypted: i=1; AL+hErEXGAnmqPStC/xJA1yJ2Oo3tZAdGMdMcTKILy8t5m6ZZIiFWHvQ6IrgChjjabmF5QIUmF7qd0BIdd5YBLRg@vger.kernel.org
X-Gm-Message-State: APuU4Z+HySfTDonp9AGBbbk7/byjPnVVFV15NmFuI83wN6ef/nI2nEOq
	nkfCVFuo8MQhJCGuOailJgP2CaXOpdWrHWYzu01DUadSUfy+cZAcbpH/0pVYK+zGzbStFbrbvt9
	A9bGX09E6goMnz3yvwbBm5MezNaTnXIv9nvYdr+0APFjMnCzlTgC29jo/j+pEo4ClZtD7
X-Gm-Gg: AYBFou1EITGeG4RhUVvYT1LCCiEWvxdDOe61vAqlMX/qNoRURPhsSSg2GVfWz+HfsW5
	8QlJOsCijadkwh242esSUOousETyZDMlqT1AovqJK2Tqt1jFeMPSRvKumq1TsIvozXqp8gyJIEG
	kXRDpcWV7uD3j7Y7bmcL9sNynPxhxwcxUMQGiKyAqYVkXo6F+eph4gBxm8YPK4ChChuSpjEcFZR
	JrqoQ9WKzLmvkYMoeiC5jeqnUhW8e+bDAzHGR9x6X9IDQ1j0HXqHe3PL6p8N72GHykybDdzTerq
	njuWbry4ICYkM4pGzlFbHwehb4lVg1Abg5+EXmt/Nojm17s/izMLEUcb8H7XALoMUB6RlzXL1Zt
	8xbpBO+LpD7wclA/60xiJfKW3gM1RZwqV9a9c3b6Cmhto3gPrMoZAnbzPmYUsTpQYXUqJl5Pnfp
	HCTW/KI9uXflhWl0G9KYsPkdz2302LmuyG+g==
X-Received: by 2002:a05:690e:4814:b0:674:d78:4bd with SMTP id 956f58d0204a3-67c1407f86emr1633709d50.5.1794013686309;
        Fri, 06 Nov 2026 17:08:06 -0800 (PST)
X-Received: by 2002:a05:690e:4814:b0:674:d78:4bd with SMTP id 956f58d0204a3-67c1407f86emr1633700d50.5.1794013685859;
        Fri, 06 Nov 2026 17:08:05 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0b5csm3091934d50.7.2026.11.06.17.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:08:05 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fastrpc: fix probe-time races between rpmsg and userspace
Date: Fri,  6 Nov 2026 20:07:59 -0500
Message-ID: <20261107010801.3451213-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
References: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S2xOatDmjHOUoNXlkgvNq2tWZS_Ht8pg
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee79f7 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fP8dIGKjERIvVM-sKqAA:9 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfX+dRhMPfzO0Og
 rc4aQJaI/RIUsGf0yG8iNyXES8gWjVSmxM+CYVbs/WY3mSLdCBDZVFggqAe19Zt9Y+zoBXnzqJV
 wWVZI6tciMBNtOusypbfOPJZMvPIg+Q=
X-Proofpoint-GUID: S2xOatDmjHOUoNXlkgvNq2tWZS_Ht8pg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfX0hSXynx5wK6U
 4OibylnvPZY3XWZDDs/xKFeA6EYiGHA3fEQLdHc0Ed+R6xExV5Tdd97084dxFyogf3KYdunK7j9
 OR/aqV0JAu5GGmsnRE81rkpf+jsP8o2mFOjjkwXEjpBYmbmABuR1LSucM4XsNBohd6yyoDe2Vc/
 46DXUuNMD0D6g/2Ms8vegO63AgBIzeNjNIKdYD6r/CjKtYup7DZvnSlePIBlR/VsHL6MJaq8fUh
 74bZ9816RhY5ijqLG23etg27Ql40HJIkteeo+2VYWFL6hrXuDjyOWueVryR/Bru8XPxt6GP3nhS
 DSc8fXbum2VJw4KYBnxmkuekSmY5km05NSvvTU0UmQjLg8BX/w7oS1yOJvYhD5QsJxvHu+0OqN+
 uvFPD4jPBH6SdIij1dPbLWZLvLClJr/slU7Rbv/l0WO5LqdGLH9jTJWm+o8JrXsvLFc67f02L2Q
 2Ah7iuOktqqWXgzQ4kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070004

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Eliza EVK, EL2
