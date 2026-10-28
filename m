Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200956;
	b=ro36NsV1p+FFCBJef8retPHr50obJIm7/U94sywB/GDQJDkFYuWSWz4d36LXcZsN3T9F
	 pu/sBhS7jG5SbZvM2FUNaTRDdiHpqB13p/ozoZ8kl9y+vtBbjOv/ETqqecAHNoAU7j2x8
	 zuPiy+2ZW9BejuNZO457/zYwcafFWNxjhc0qR6C5WYdNPrtQAqKReqA6DyLmofbT0xs0j
	 08jyeVp+6Vb+GCxR4mAwsvehFo42Q2b1uYiPFKMcBl/uNjF8BybtaBOeYsmwEF27rcboS
	 ygeXzkEAk0PDpJdumfdDE4Ey5uvGrSFWci2PoObHINf4FPVxLVfyJ0DZkGQ3yqJEH/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kCYJhvcz0tkcZ//57aYlmOVbRldIvDRnjS0JoS2KLB0=;
	b=4H7WOptOKUsM8ciRE91pVIzd5bluyYm3A+scHYcMwEb9UDGcbHbA+2PzdVceecwKarHD
	 x/DMGHO13NAqGIBgHbopjtxG6RdIgX6x6kC/35MIkZTS9FIa3SS6IbkzllHXv2w/o+xIG
	 YuhpxXjV72D/Ox9gZ00hr4py9iPZVV+cW08PGCozdSwEh5wMm30DgN+GA/ztj1W/+UQa5
	 Vtb8OhU/MIu/2IEvdzo3JkiAwbp3qdAQL5ZwapyqcBXKnkU7zQPzLKnnRTBCbrVoBJAPI
	 jVxutrxnF1cLgjLvJPaNFqqghj9BU72/tCM/hr4xWeQrth21NyA+e5Ykco1Qu/XO3rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNNXo0Fm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inDwGyoi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F8860A5BC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F8860A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNNXo0Fm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inDwGyoi
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAPGS2544064
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kCYJhvcz0tkcZ//57aYlmOVb
	RldIvDRnjS0JoS2KLB0=; b=MNNXo0FmsZuMVCHxoLd/wyoAUempg9g9tRIApuYA
	IsmXFhtTFD60GeBKOj3L1CdOzlH+O/oPOMwLZzIZQUgsGFjelJs5Gi6qgKZq1yaD
	vWUi1gLrlioJzIblvwb7ggNO3mPPr29Nl0+YOkKqqcfh6oTQnlmgJEvJ6FcKl7Co
	/4jGd/1CNYr1j+Y0/T/5zzCFxomJO5+RtAdcpSO+r3gBbMT4kOhaq+FPdnrBQYXt
	Op0Nedj8SmEjD7kdXUR58cFGqgKqrUJZNA+onMeCDXQhAnrcknosuVcpIH0ITcaX
	7mfWicuD7slSiSfozlX++Y46jOzoqEKr4HU2y8C1EmhwUQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr265-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:22:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eacc615f73so1191163e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200954; x=1793805754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCYJhvcz0tkcZ//57aYlmOVbRldIvDRnjS0JoS2KLB0=;
        b=inDwGyoiF4OOP/34wRsXFATCAVk/i3XrFE6wo8uYkuEH+Rm0lL/kndHt8FVK3pWz1y
         P0hbu9WXXzYtZUMHXKINOIEqff38u9djCQVbQD++LF1SMC+tcDmnp9rnpSzPhDH9JwYN
         De9hlo7nGfL5jPLCdSZ7GLK83yoid7d+ifYsqBvqS5cli0y5OLFxJvbb9nVL8h7qBOCj
         aN0RCQy9HfsfDBGUucgXc5O0vNHMA6FCdB5sw4a8is7vWMoTfx6p9rYLP2rh+8qPGzU1
         QRlGcxE1HrSKPEduO/CiVUZLMue2SUFrC4YvMmmxiiXaTztdRIE8GqkK/RPqrohhchmy
         o1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200954; x=1793805754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCYJhvcz0tkcZ//57aYlmOVbRldIvDRnjS0JoS2KLB0=;
        b=ae30QjNdpiVdhY/tb0gx9F+Bn/PHZPDxOOyGObIHa+4UvX/UmXM7F6CjnPT1xCx5/A
         up8XRpk6nnHVCAlillBynAeIqV/bCJoLR7Up2gh5HcpX98LmdOG2sKF9JH0eykcGxw9x
         8E+BOH2m8mcUxgtEkc+ixMs8Uq6pZTc4MRZ24KvZXqys3YWUNFLmHKmdzSiIC9tED+Kr
         zYuws0np/WW8ONCjL7F7XvRsUMs9e8eRFrWOSK4eUHJLXgW4jhLLDrhsTSOIlZc4RCA9
         Evn7w2EcZGgMiKh6sYk/tDjH3eQSufoPHJM4YMJp87elcrK0Up2kCOvSlIIrwIymKNBU
         oisw==
X-Forwarded-Encrypted: i=1; AKwUvByod2esKFvhL91CYJCU229lyGAW3mnZtW/4L8lcZH6paHt0Y4JvdxOmoBeRnoHjEiWI7V3ljRqDradkt3GC@vger.kernel.org
X-Gm-Message-State: AFq9FYJhZxPMQe8z8ErCqKx9A5PiPzTbHCOAIHuRmTXD42e/JKsxoYeI
	YtbmPqfOQxCjHnLAlnM06vmEiFGHwB0ryDTDXeX5ZzHYYZU0XMfhWA/H4E1i4wW8X58sNTHZpHa
	Mml+/xZ6ygaMzz4+tUER0vBpzjL5XPVt4B4c6vw3gxu126oUrC3P0zlLLegZUYng83qaGsczrhy
	ef
X-Gm-Gg: AYBFou1NnVSveoMrkbLLX9wIFSR1JZgmpH4E1K1dS0ygsplWroMsZ041L7CZN7dVlFC
	iARkFFLNuSzE5SoWfdgTIDU/Jc4ktILfI8zqQ/LcOVYWYCeKTmlCXFxPi4CV90X8Hq2JttxwQBd
	pAf7AnIcveEpHQlyEx9OunZusxISmbx10Lgik5H5zqDgavGtckniPMN55e7QWktasop9GFsdXrl
	6fBtoGYrmzkfEcAZ12kwOsdfZQKVEORz4Xs7f/1JXag1vHWN8euERUTwMvui8cV3GEN2RWPkEt9
	huiQfVdhpW/TytR6oyN6+xhZPsbjKZI1IPOWruXGrsY5fM85R6EtWI1HloBQ2LdPnszDWHDFyLx
	UzAQkILRB6cVOE37+MsgHKwd6CsVxcNLjwTxf3K87UTiFvPLDQm9DaULwe9ypBIdFoQ==
X-Received: by 2002:a05:6122:4d13:b0:5ea:ddfd:3e99 with SMTP id 71dfb90a1353d-5ec4cbf4e29mr1354965e0c.10.1793200954323;
        Wed, 28 Oct 2026 08:22:34 -0700 (PDT)
X-Received: by 2002:a05:6122:4d13:b0:5ea:ddfd:3e99 with SMTP id 71dfb90a1353d-5ec4cbf4e29mr1354925e0c.10.1793200953762;
        Wed, 28 Oct 2026 08:22:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm30560833f8f.24.2026.10.28.08.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:22:32 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:22:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] soc: qcom: smem: validate private entry list walks
Message-ID: <mpnzjjzlzwsv4qe25f36ox5kmxcztpgxf4lpxlmrmzqwhfiuwl@iquwzzn3y46v>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
 <20261028-port-smem-v5-2-121257d490b5@redhat.com>
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
In-Reply-To: <20261028-port-smem-v5-2-121257d490b5@redhat.com>
X-Proofpoint-ORIG-GUID: fZR5MT_pz7qLK4uXwL8TImZFK8ybuQGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7o8Te0DcfK2G
 BzUxqY366Gv+6fUlstK6JyjZdmlQ3gtIfn0KhF/V2y6AGhqD8URLFJZUan65+P1BQZFhd4eNfBa
 ZgsMPwveODtiW0eI7dpeV+0UGxe4L2d47UqWUYoMl2LN1lsRfjWfKBuGS21fFMvW92oOlJD9D6N
 cLs6vnmcBZjTGhfAvqgJU3B4gRrYHQ5nsQc4OjCE+wqbftFdgyw9XFZxdWmnHa/kwx6Xf/cUzeJ
 synFbEBAsDnVUiY2aumfkVaNqwt/46h3KZSSO96cDrGzR6Mry40yZfwqBpZkDKJ1T3E1IlDOrae
 JWgqnIgh753EmwDUUnwpsESmZaorR0h1XvgihXQOsCa4pXxMduE7yB1k9anGyraT09hGIPdIrLe
 e0+V/xOQXVTnXHjNxydoA+zeI1IJh913Dvkzaw8NfmSE+uE9N5KrLP/aQv619Nky5YmXxmEGue9
 SsYgry9ZI5h1P3Ex4yQ==
X-Proofpoint-GUID: fZR5MT_pz7qLK4uXwL8TImZFK8ybuQGL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX67DouU47iGpB
 snH/LW8e7br1CNV5Qq2089PaJKeOL0KLrOvnFEgVtYfiKhsZg9ljSn3FrCRzgAEbtIFR+qBldyp
 tvCWBYFTOOnHqPCcN4xtPLmHJRFqoOU=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2133b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=LYivK3g_jumZP2eLkpkA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 10:33:49, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> When walking private entries, use the uncached/cached free offsets as
> the list bounds, require room for a header before dereferencing, and
> reject a next pointer that does not advance.
> 
> Skip the cached list when the cached free offset is at the partition
> end.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
