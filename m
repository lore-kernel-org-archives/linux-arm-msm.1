Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013691;
	b=xS2AQeVa/QSHjOj1uYkBw5tXZpItB94tB3oS7dpwmDBRZDPlaezLs2u7uoyfbtra7Sab
	 j+g0cxsy+FmNMB1GBvw4OtBDThTTBlbi2bJHRbtgaK7uRY3sXOkJJqBhkcs8lmw0YbUqv
	 4dfwC9AJ5e8vMCrrzdKE48NuBdp5nCFg+L1pDAlRGXrDBt1+MhfFInJyWG1wX7hLqv3N+
	 6YwfJ//rWMOOKlfc6phSFdz+l8L6LlKhfFDNzlc21w3Sccn+Lk/n/PxN46nEhkygjthDK
	 MTBvtUonQAD687YbpB4erArOdyHw6X09wnB0APrg0t61+qb5z/0+NGxpurRMyKROHRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2LT9f4/r07lEFqji6lCYM9PWfKdD623UUCASE9CcMk0=;
	b=gZwi77moTU/U8xcw7h2GSrd7l9IFiW570TewwBLXhGSHhdZZmlzIhJ2leGURZkwM2HkC
	 TMMPkjYobC6cZJSbi+spRao9c3nu0XYRVXWVp7H5XFRDyGEnvQ79l9M8Obt0HVoY7R7Tk
	 Y6IbS92nTca8kbqo8A3gWjDC6V4lvTU/tgFHX0tTMpHEvRAhjhGcoJFTl5uRzcqE7gmJ2
	 n/3Td4AvtqfL+LYzkk9R/5wchMjbIyOryYK5Hmw4V7x6eJYfjlvCCy4vqmmmy5f71PPbr
	 0OkuMyBCR9ZoicwBC/zheXxKf1aZA8DyjUZ7cREHPpgvZJfQkdUN6MZolPkz0AqrK/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R1G1GkqS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2N4brTY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FF9606D80E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3FF9606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R1G1GkqS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2N4brTY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A70JpAc1295574
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 01:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2LT9f4/r07l
	EFqji6lCYM9PWfKdD623UUCASE9CcMk0=; b=R1G1GkqST3Ka3ccrGX+wXtlKxYX
	SQTS7LRp5zNjKl1excZLOxD/eOaOlRiWe9xqIHPoyNXsu+mZpXbIKWkfxO6giJj9
	FCgHKhjWndS1kuNKyRTbv/BPlClf6VlrNZpQozDPCr4gutQnn0GRWgzFGZpq5KWq
	DZby+zgHicIVQuuLXeXTIH7mo6Tg5/r/G1rGJob9QNFd6GGZ5fRgUCzyJLbgilZO
	GOP3EYrwgxgD9twElnSp4M8CZd1CSUffbZIULhYA+AcryN+YuyJs2To8iAElxSt4
	UeYktTVFt3Wqe99TpCkYwQcTgiDlDcTEKcpgxZ+V3Lc7h83vbG9b65wJQzg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnr350-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 01:08:09 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67be4f2f42eso2007763d50.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794013689; x=1794618489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LT9f4/r07lEFqji6lCYM9PWfKdD623UUCASE9CcMk0=;
        b=e2N4brTY12xSceHyVj4rtHTKr+Aaqr1TlG+MCaKXnpMF6YdwXOre26DOpJ5OhGHwjj
         rTsid7ZdARdzCP2G4H2romqPCmpau0CY6+DR9243mM3kqfIBKdUy7TEZeEfLBDSEElO8
         kIWFmLU88zANMbXU/XRN4oHuASqz8n4SkNEMen19ssDwbftDFu02miC/VPbi5/CiUzKA
         e7S7vawDUyAkp3E33jTakoItA6D06eRaMU3jLdpsfhF2paEmAbUV0SGzSkmL5BUvkulf
         BR0Sc/7DaMHFfMIBwd16cJqz13FXZz/c+WB5Nx+m8+Uoa21egRgDjXQe/PJOP8fOkjYW
         zLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013689; x=1794618489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LT9f4/r07lEFqji6lCYM9PWfKdD623UUCASE9CcMk0=;
        b=FJRaaFcvcxUxOLihVE2Zv/0EZMzkKXNtmCkFoe534xZM7fEd9osyOb9ZsN3R1qRD2O
         wX/2NZhqmUqOoOzj61nTQ1n3uwOJ53AV4rJ+BjTpdZWyWQ2yf1NJoS0fYpLzQKBrB/TI
         LswzKoFZhO/GPruO+1XIr35M6IpggIbcAVv72Ne8mRReGNM1l+Ov328c05gLNMGSOpzt
         sFXFQwBAPmzReqaeq7LXFQzKJGF+1idkQbPjv8K+HV2QRJOtkG1tD39bO4jN91vvx2CA
         sFhuTKCQ7dr5ztjhICGyheR1BTjW0w479CREghCdpHxmlvm5U+kgGs/um1JJpD3bQb/A
         9WEQ==
X-Forwarded-Encrypted: i=1; AL+hErH9NpO000S9eeXbb5cDXhbxh/z03gXkIwN5UbQT0joEx9Zi0Hxr0+gHYtsMP02G1cW8XGYnSkWRUiOtBJuV@vger.kernel.org
X-Gm-Message-State: APuU4Z/J15IRd/0WgOIRYC2WNw2jMXUmTmiJILiQmbSnH6uNynnj4FqV
	69kA/AyesoOiSyHsSmedtsWomIZikuJbiQ/TRwJqlh8I4726FJkfMWEHRYN78tjyWppCZv5uzzg
	RHud7l993RGhkRrRNCUpKe0KqZO9j2Z7Qg4SW1hRw8RRqrTiOzpmryMabXFtTQqjT+sXs
X-Gm-Gg: AYBFou2vkuJGq9rso50bQZZEK9tR0/mH6LQS02o+OP5P+/hfXdZE3fb9iFVoJ7/Xe8t
	LYVxGIMC/RF0QCriURuE1ziGpuBWPFhX6h0dcDEQ24GmkuD85qWw+blvYw6SWGpY00v/xMRKWd0
	wFZQlPMcZPt1/jnWGV+YSwEm5HqWoviQhr2wno2WqkmLL6Cvs9fz3/qSFwrToNaWyjla00IAaoE
	qPQ1h0F6K53vuk4HvpPC9bm5iPYXbuaoF26OSs1OLn7Hoy5L9liNhC1qfDn2SDb0Co6aADupOn3
	bmQnDIp6G/JX3jeYJmvQ9cqIeC28fYfPMfNUXbAuG53sqQMNUQqKJp9ppbNfkPoPvB7wZPKdTVn
	Qrbxq7g4/23/XjRqe15+jKCGZweUtQLwu7BBcCclKj81i5V3aBoPU/L58jAuc5D/fQmjkV7j9nd
	HvO7yubqpuTqxIe+Ln6T4NndoQRdhSir+ZXw==
X-Received: by 2002:a05:690e:438c:b0:67b:dc56:caa5 with SMTP id 956f58d0204a3-67c145cb402mr1178067d50.114.1794013688994;
        Fri, 06 Nov 2026 17:08:08 -0800 (PST)
X-Received: by 2002:a05:690e:438c:b0:67b:dc56:caa5 with SMTP id 956f58d0204a3-67c145cb402mr1178062d50.114.1794013688417;
        Fri, 06 Nov 2026 17:08:08 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0b5csm3091934d50.7.2026.11.06.17.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:08:07 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, amahesh@qti.qualcomm.com
Subject: Re: [PATCH v3] misc: fastrpc: map ADSP remote heap into remoteproc IOMMU domain
Date: Fri,  6 Nov 2026 20:08:00 -0500
Message-ID: <20261107010801.3451213-2-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-fastrpc-kvm-iommu-v3-v3-1-f3cd5c030c78@oss.qualcomm.com>
References: <20261027-fastrpc-kvm-iommu-v3-v3-1-f3cd5c030c78@oss.qualcomm.com>
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
X-Proofpoint-GUID: ocP3MMC_FRndyi-nHn4a0JBkmKR0fKTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfX+reiv1ceiSRz
 0ZGr/Hv/Vd4ZJZLDFAxqzkjHq5E+rf6EYOGrCanQ24W0vQ92pdW7hCQGrUayGBwiUccvo2eOMAb
 UE4sm4f6wVGvxeyLpyfrW85IUDU6Guw2hJdmCWyaz7L518s3klSryIIwrWFp87LewTs9nL53tyF
 iX3CkRCRFjAcSkVxKEKkZppbeB1+BB4p/20xr5y9bHTPb4Rq8EcHLao+hpov21sdMpV2e1sILtr
 xRLe975k3DyAw5cL7PGPPMYvsogVEKVxZNJpZOk61Qm9bV9sLmGdgrifKsgmzvzMuY3/VK2+Ngt
 xOoV/oZRieM2nwAp7vsP1IuudGs1RMFZoGVqIX3Gi5Wx9qitW0r7By6z3NcURm+FpsIqYUu3Y4k
 5f1Tmsc0gOj6hiiCjUfYLzP0rlckDVAW/PYTsGskodc8dWrdwrukppwE+Qba05WUkiPhBH04XsE
 eqxV9HH9Y9soZgjJPqg==
X-Proofpoint-ORIG-GUID: ocP3MMC_FRndyi-nHn4a0JBkmKR0fKTd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfXzxY2keYOaWM4
 LprQxUftkXfbls37Ivcb6YcSiB5zQogr+8TWYi92KSGeKOdIBiA87B9LMHBsuxAdi7P3NjXhfhS
 Mr+j1Q1rqwDnUdMPovM2gbzqjmYCqEA=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6aee79f9 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WGrctX7s3ODQAISolrcA:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070004

Fixes the ADSP SMMU fault on Eliza at EL2.

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Eliza EVK, EL2
