Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201535;
	b=WDI2vp6ADlVNPdJkk3TebuH2FP8o1PveuVigo+hV0lnM39VuwuOIByQ5e95f+kW/lUT0
	 XPV38n9hj+IjP/BnyVUT7TyqPegMby9igPsQEci+2A4ttsBT/Jd5gMVu33/UiiSUUFIDD
	 xrsWlfWaVSz8XGbVK9a+xCJxxQXuyEdLnoxHVe6Jbt6OpgAKZhdM0FyogNhkZbFSPmmYK
	 5uCnJuKSoGI1BlmEBmb09VmjCrcYLBbI3iq3YcbAnMeFXhXyxHABBHkKVsEbbaVqdY6CN
	 LTFz5rxclD5KrHl1ZRQ8IL/bJtzT9C4eb7l0e2KtrcIteciXiHxlnwYk1L8WAnYYmYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
	b=i5I5k+qyyfDjqv6g4rQAcPsLNOeEKK2UcJOnFhikCuhRvE+lRMgyyKE0JDYSzoGRwHFU
	 e79ksFchNnJl6VUK72me43clQX4Ysowv06sQOju3v22wWAM457b0X3hvjck6CN3Pd+FHD
	 JR8LumxEFICMJdK0ueTfQKqioCsHzl1Ou9hSMDWLty3Kymqb/lSfVe3RAeYKHVElTVA3q
	 ZPbGD/Du4CXyW5j5wGYIPJzO0l/7W++x/rfR82y9PYBvyskTHpelGQ26vy7+UDUhpI7Bx
	 e2gTYvLiWMuPv3tII6eNdaCd8HtPl+CRvcaBSI/+Byr7w8ne+nE35QSVSibRLhkw+Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxxoOkAg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DISU0S2i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40951606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40951606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxxoOkAg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DISU0S2i
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA3uH2568825
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dw6X5L/ty0+ycNiG4u9zRpL
	/2FUMzoeQTvBpaFK47Y=; b=gxxoOkAgvYgEftnhw2pgzvkiYD4Uhg8U61y/qrLr
	1AbXFIelKKeuJojqLKw4GNM9ICYpSA0qVmD0e4B0TCsuPbChkGZViTj9rKMymemO
	68ShMAPHSz1A7RmQRJEY4FCqoRkKJ8VDXe92XchE6SICW3Y+zWsaICr3TyU+UfKA
	v7BeJcZUdSs/U7jdV7UYeCxNnsBXQnmUJk8/LoKhdgWaMhxoh5naxUVTkwcdhcdS
	vqqbCZgrjNBjdFxzdV6js4DW06AzENY0zovkLQIadT6YBxpyiMwfU8YY+5aJ+mi5
	fFwJLzyzD6ANoSe0IhQzl4XoxL1uwFlpk0VjYe+bCMdPwQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pvae1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:32:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so769027137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201533; x=1793806333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
        b=DISU0S2iUL5DucVtYKgbi/ak+21KT7Oi49eBKx5WpStF5j/n0h9Msiw3WdAC0rconx
         GRIYPpPun+EuP/rSJ43VWs3yeeAIGJvxsPeZ7tdyEZfhq616JemZMAlTvK10Dn3CXYD0
         sMbkV8Ek2IKXR2+qyqnpSLNiYDUkNUp4ZqF7bwefm/5YSAjn7U+jnI+1TbyfUxTRLFJ0
         Y8zl4uZNmIoxNx2/2/kE3HqJr6PzKJ1hsMhwkOeV6sxvEN8Pz/jDsxFS384g5yiu7FsW
         DTRN7sT6TvXuCh35oFXzcSBtxDT3OytweyhjZ1g6aQCBOFHCedGtmY9ljLkhBsWdH1zd
         Pxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201533; x=1793806333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
        b=DjuJDLx0LvpNJxCk60rSrX2ln3lqbMxeiQsD5P84kIz5XPfH8/8TOJafNWchsDlHFq
         171J4AjxEpzd9VaG2DbE2lHz9l7vtbFzi7QgdjuVU2k0L5cooUALDoBCokDbSO4X6M4L
         UgvQy1p7uXBX0CPUxh729ZuaRup9ER9m0bOlHrdFLvPfuQqNgfKuoiUsCkmUIAkoP5z/
         LK2wfV+lTNE5qJpVplm2I2nfz/xebydrhfrWN8/c5EYrEOb0UuMvvT9wgUDcWeSPxusR
         YamGTRotvYm2H0TomGOxKDgjQyH17PqHZb+Xq020nY0ci9xZ7/j8fCM/4Lne8OFkA4Mk
         wdOw==
X-Forwarded-Encrypted: i=1; AKwUvBw2BJF18YpaT+oPB8/eWcWT3N51RQSj7W8cmSF+WipK9wmosZyCOZMmY7Bgb+o34bs1miYxXuOSp2kL00rK@vger.kernel.org
X-Gm-Message-State: AFq9FYJxylukwSxlxOef8AmzQSvPQz2sHe9P6GOf/naxBcQ+4g9OoWL7
	GwiavUT+qwOKtxSm3MQOhsPX4/Gjpv0xKDrDuOVY3bVCS7iaKOtDCW7A/JsvC6i9oocHM/OCVZe
	BxAoKXlc8nYR82vkkTImtUNZV+mrk7afiVn3xgy9/VSH6d59OU+MpFRxsZiVtq4QGJClD
X-Gm-Gg: AYBFou2Sm5DAmLlY47roseiRr751E6VpLaLOpLf2jkbVXh6NufLzbxKYw5M1HeRJoKt
	moNjtmLFiIE1tldFl+tVbMuwHdJKUggBHKc56nl/R8Zx8F+5VMSRwHPrCDeJJQg0nTvmaXrpURB
	QsOSkuspAn9AtT1wAO108PpeCbsXsX4Ik2Zp3q7bpJyfAmQiCGc4FAbbNOlEGaIepxN+i18C69D
	xHj/0rjf5uPgY9DNJE1MU9hFS7XONcfzNeHh1gz/tfkBvq3NDNU6L8NRcpZ9K4jMJhqqaQgh511
	vLYI7CLNSiziysGJxTisMclPc3d+2RRghwcyGaNBbQ8GBhKg35q0TtNu7KfjPAwbXExhfhki7pF
	nYzo6BeyYb3jqmHmTWi9PGamj0Y5Q1mwigaJqniHEh3eVhRZ11spfqGfE4UJftioc1Q==
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d03a47e768mr1432378137.18.1793201533205;
        Wed, 28 Oct 2026 08:32:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d03a47e768mr1432303137.18.1793201532446;
        Wed, 28 Oct 2026 08:32:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm195145e9.7.2026.10.28.08.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:32:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
Message-ID: <bl3vrhszm2aicw4bfr3v6mewh7dghwpiverpylif6njbqwnjd3@hxqtrtt7cjyh>
References: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
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
In-Reply-To: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qY5KQQWQl1tRkQy0Q4l8UA80YqkjzF8m
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae2157e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t_aS6gOLZcFuiPoz8KgA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9YeGhdsQ97QK
 38a86ckG4I8wwrulDa2HnR+SjrAEQ2Ur+/B3zWuQbhuj1J5oYhQOFWzOMgrwpOfNv8MXPn0xpRs
 W6C8NIB/F8RGzW01Nq5UFsYJAUH22f3mt2NHZFAiIw9P1DB7u2QjI4wotdfhN1bOOJWGVpxjzJC
 Gt378F2lxRkVuQd6xutCHdvWyECkVrKDbi4NrKu/4z3kaH6JgDPkqJp3f/1wOph1heTJMvh7Qee
 Ezey582TRpQVo/5a/uk4K3WPfKIowkSwkz9sLtOXujxVmPZ83lWCKZEoicMimTYZiWFMDwcqD7Q
 1kTL8anT1Ydy25RHT1Aeadnbm5DWfAT2XF6Eh4OBWLbplYNVLnJr20nEMg4gfTKLPIAKWkLTwwK
 kov+KpLrPXItQDCFXZVpQe4NoD/fSZXELpPpgeigVsPAw85kammIh/4ptSMAL+tFA6e4mRlFyWc
 Fj47eHROuEf7xVhwhRg==
X-Proofpoint-GUID: qY5KQQWQl1tRkQy0Q4l8UA80YqkjzF8m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXw7kPTvYWNX7l
 9VCiGukVLkbPsR4QPuU7ZzV63TrWgU30EoN1tCahLrnwpTadfDMvL6N+ttIJV089L+Bpo9Wse0O
 4j+HW98RrmwQHnx6B8vZzrIagWLZHgw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 15:05:32, Taniya Das wrote:
> The PCIe GDSCs can be shared with other masters and should use the APCS
> collapse-vote register when updating the power state.
> 
> This is also needed to disable power domains that boot firmware enabled
> through the vote register.
> 
> Describe the collapse-vote register and mask for every PCIe and PCIe PHY
> GDSC.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
