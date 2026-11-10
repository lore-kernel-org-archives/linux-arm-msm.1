Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303299;
	b=OPUjJLy2WhQ215rBKj3F1do1utRKQY0sw78zemGlakVXAVTgPSWEui0V/79Cym4eJNeo
	 VMIrfdY9nfG/pwoS8zAwEb+UWIxS7cHLunuUtOhv/U2rUMEDTyQp6tR+bOaSl9RT+dtCR
	 QGcrcil6isxMEGFwd/vA+NqJzkZ+fheOYkpVrezJg0qtoGAgtssO+39gJoHN0omcPhspw
	 Zb5oz9T+kNM48rD5MS5bLt6ljBRAUM2fW46TEaljlJKwyMeKtaU9ihsioDy/VRCHZU5FF
	 l4M64djatORrARyNDCAkOsWr5S92arnwSKBPrtTi17kzpKpyC1xQo6d1fkUxCa54TYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OBBzM+x58lSGjC6iKeoiB5yPFJBsxPrwM8tp/hy1BwA=;
	b=j3Wt6JUYYmu1hkrbiFy+hkZ39rUqzxEVkXhGV0VrzWRmWjkgm7FjMe8/Bb+SP0dPjYm9
	 2JVYv8ezWgQU0dR8gArPibCJbq/jt2wT/GON1sm+1xCPGwX0CWJffyrQ7nqg6n7sJ9qC0
	 b37pmhqCHW8jwhPjhhZIBl9QRaR63xrQSvcwAVQfvTf1EXqmysFX9u3YXfET2pEVfeP3O
	 2kqeIC8AzNE8r1vsaNF+PEL/YdCDqUQ45WT1pM5TxcE9XtCBQBuqUODsLDSneqYilXtxQ
	 RlCwKkoPdyzytYuJF2INptpsdA7JQsVZBck8FOhTpwrYbX2o8wh9k9a3k9/lgB9506A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jQcUM9L/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDy4Vx5e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE389606C66C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE389606C66C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQcUM9L/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDy4Vx5e
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lECH2240816
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OBBzM+x58lSGjC6iKeoiB5yP
	FJBsxPrwM8tp/hy1BwA=; b=jQcUM9L/ieCNI5pHGV3sB6qxYLZR92hzLhXJOhDI
	4KlJg8X5ahYE6N2AlaztoAwLuI+p+H2c5VI9uAqqFiqNz1LMUa4vUiAAExkzRvSf
	Wfk2v6kc/rJ81Vdml4z6cU1Zp8af1Glw/deQuVcYvt3x1kpQN2ftPUWQPk0zDBx5
	IVRY1GVmSLnjWSotqjufr43LYK8BfTdqVghM+3zqQgYx+1OSB2zbqi9GJ9XjtBGZ
	6kRMzMovddf5Bv+pvSZmnwIDBIAWCm/+h+hZwX9poPSdszW0P6wYAFIGyDpcFouG
	bYicA9kS8BmTp7MNeXT9GmqPJOdVQW4BM5MK8qy1eIIg1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1byh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:34:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so341055685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303297; x=1794908097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBBzM+x58lSGjC6iKeoiB5yPFJBsxPrwM8tp/hy1BwA=;
        b=GDy4Vx5eCpS31QWUhC7mhwWxqYP5qijakuYzITpB7whmp43eXuDeBhzTsssiWyoeYx
         jt2EPhTcIFtOgzGoCqA+nwHi4vbskxl+sRvErZYO0wTomVurdyhoF445DCSA7cyZgRyu
         G4JFMqib+Ik5MVneGILHwNZXZn4h3k0smeXv8l6tVymiB6RIppaikfMv1T4T9vmBiGo2
         p3JM/NOy3hLU18cNepJb+jyrRnlY/TTDXuwQYJ05saDmroUjKNgtuG7HDMUxDOLModz4
         oQ+0nRKvnYi6bOkE4HGwkK7XhkcHbVgxIXWvsk0XOEwdK4Z/nvyJYGKdcE/1aXhBeSVE
         oXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303297; x=1794908097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBBzM+x58lSGjC6iKeoiB5yPFJBsxPrwM8tp/hy1BwA=;
        b=EKSD9DWt1ddCv0PQ6g1ky9rRO6E3NnVwDyOgqMysPpgeu6rKevR7/H1/URMJYbXrFh
         i5rTt2xRdMl+WSkozMehWB3578/hx9Ldu6tAWQ7+zrnbvG3JHrn6GJZm9DtXjnu21YQD
         V97YnN6ZpDZJ5PNi2YfGEto2HayWA0xdbEXECMzcfyNpOzQYK/R2VhG3v1mo0Z4XR8bO
         S1ZMXBtxm6ysbh6ZrFCO9VsVzi4ZdlsyconsrP2fsRmgMbDYY+k89W0Sg6gV+MBs63Zt
         gVcjmXLtesfUndXjofnRq+H5AvAt9skZqnQP/Y4ZjHZTBsUFSjYoTtmuY/vZ9ws/nw/n
         /Jww==
X-Forwarded-Encrypted: i=1; AL+hErGxAKWQdSMa+6duF7lf3OYrWd32yReguNFFXXPHuNhZw3eHXIPxgMnyOyOqugb65xvotkNstFTICGl8jlt1@vger.kernel.org
X-Gm-Message-State: APuU4Z+IsJdRRj5OC44o38G1dF4zr2B8CSBVx744jcKTdtfvV0xku1q2
	YOdMEPrBpNVOrVTgU9Fo/veZUL8AiVSNnm4YQ1kMfccL6dtnTss+9af5EaR7QNZ5FdwzpPbU9LP
	Oo/vHIza+3brWF7t4BO14VLO45d2SkQCxwN108E0qGkhykkTui7x2whbmeOtNY0b7I97izXuyyi
	OG
X-Gm-Gg: AYBFou1uL9aL4e26Su8hNZpWkGiQTs+golGgmOznGN9e0x0xs/zKKrgcXLRU4QqCd2i
	/Q6DUDccSzWzxttGsWy/7B4CzPCOhXTVjdBi+6kal9AWQuzI3C2Rloq/tY3w2SnyTbnOPiq+XIN
	DbwKVqYhAv2hUClU2TIDAlDSel13oRtCgmJPnn221N7+XC8+Mjl9Mf4XBsO0zkfwEnOjN0gupac
	GgFcrTGIk1tsH9T6xw9FawDxD6rjtuLShMU29BGVoPZS1TFsVWTIgiVqQeBeeeYMz9MX6i8XPGX
	dbFCQpPJUO/e0Pv0WslNZhzwN8WeHB3aEpln5CxD2SdO8OWHwf13Jg1wqVraKWq0N3D5goBLsfT
	p+FZxo/VmBHwOATcbNg1qxAkoD0jCOKFotjcNCayWU7HDc3sxHVzY+DXxfLMGNPBx
X-Received: by 2002:a05:620a:31a0:b0:93e:95ce:539c with SMTP id af79cd13be357-9479f1d7b57mr308876685a.2.1794303297219;
        Tue, 10 Nov 2026 01:34:57 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:93e:95ce:539c with SMTP id af79cd13be357-9479f1d7b57mr308873685a.2.1794303296619;
        Tue, 10 Nov 2026 01:34:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm49545735e9.7.2026.11.10.01.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:34:55 -0800 (PST)
Date: Tue, 10 Nov 2026 11:34:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 29/29] soc: qcom: pmic-glink-altmode: skip retimer
 reset on DP IRQ
Message-ID: <c5xtcdsxds2476itvx7m6s7u2efqnses3lo6ugqxnblrxwu447@g5r3tmvqzdzl>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-29-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-29-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xy5BwO9_acAaHlyUiJqq9wO_IrLn8rcd
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2e542 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=a7TajEPTInBWvrS5HM0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX8JSBI5vWBcVI
 uMPkEaiMAZ2RFJsKQHoqnYWQ4VqdMQNU+s62BpJ6OsSEqYwt2dV98S1ADYqAHv1NK9puhv2FDAf
 UT/FgtRTt8GhVUdvV799ZynMfHj3GE9Epn4uaN5GX6Gwp9UGcAu29E5w3uIKNWCqhb9mwtLIq5F
 E2tFSXJTCdPrP+IDxtp2NDSmKuc+LwAH+NByq/+5NTmyNWiBOMlTZsQYd/S/qh/ZSGQwygVrDED
 lD37PH1dcCdEs/OI4cfpjDkLZS8xYF3wYP48GelpoP6XWIWI90zkapWKFl8xmZg3ZZ2hUTJ6wGM
 qLz3t88hyYYHmbpqXWzTGlNI3GGyIogWexOMvVwjE2TcUyak2+RJTqAQBeiaZ5hKVbJkSOhibmp
 hnO4l0y11GWMePDR3i+54tytpMAXV55tl65Ur6FM6iDhww7MhIPZ1OwejFzSkd8epVsYDk0auwK
 QoRdXWUc/06kSgHQw9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX4S3WjdRDKgeo
 QERNQpxGRQ9cH/SgO5qqtfIemMYaG+gQcyds3dwEM4KaMunRI6ZjzRWp0DzmeQtNJk7ugKocNBN
 R2dxaLf9nvchowb3W0weGXNHFbNM5zI=
X-Proofpoint-GUID: xy5BwO9_acAaHlyUiJqq9wO_IrLn8rcd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100038

On 26-11-10 12:54:50, Yongxing Mou wrote:
> A DP HPD IRQ reports a sink-side event and does not imply a Type-C
> routing change. Reprogramming the retimer for every IRQ can reset or
> disturb its datapath while link training or video transmission is in
> progress, causing intermittent DisplayPort link failures.
> 
> Cache the successfully programmed DP retimer mode, HPD level, and
> orientation. When an IRQ arrives with the same state, leave the retimer
> untouched while continuing to notify DRM so MST sink IRQ handling is
> preserved. Invalidate the cache on non-DP modes and after a failed retimer
> update so later DP transitions are always configured.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
