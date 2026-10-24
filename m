Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837832;
	b=z8cCDBL6ZHjM3jAI+jxGvVSMlsKXz7fUMCTYL3aod2H54XKhbVM1eiGOmXOBuIMItZNN
	 e4APdl4xr2J5v01GK2uwenE79DQW6uomVKZVYF85N4pNjwD5yFDX3sZ53v2UktTRrUdkG
	 Ky8yTU5R/EjE5gXJs18COoz9QSya7+lcX5lYpI2W8GMBPIpL7+9WEfhVNfGRoi5PzEf1D
	 lym3PFYalbZmePSfHIuCXz/on+lyfxh4xlTfwQ4Jn7s/VaXOrU71pDtH4vCNchw29e0UO
	 3jswXO/zMrUJ62AzGvpuTl/TacUDPalsIj84Z6bKoUTCERwxPMvWwUFNVf/TelqFqrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bxknWd2sQZ7e6sMxroosiyVGZDXHne6mb0NckvWbH0Q=;
	b=RRSGYgOdBPBZyUNXP/aOASKCxiTwNGZyuwxu1xvLmmuQ5IdtubJHqd3oKghgZe+SwPhb
	 SbhWkaXRDbp2Pm8jJZJ168YyFVvcqi8AJfGomoWDuMKXhHy/fUlUmYwZo4GE5VDJaalSH
	 Bz5hdrr/sUJTcUp9mIh2+Ne8HEbfXdDBFrdu7NQYivHfC/QRIHBAojdbF2oliGwmWjha0
	 I+q03gkOzxBwKCLiHGp8eh4NUlc0fra/pi8yMCWA1aWqkwUywUeBrQANt6gG9LU/TuSxz
	 6jh/FlAvTv3dPuXt2vy3SIicCV+WHLuPz87rd1FPqlg4Xh7UHHQVUFHZdug5yFhPp2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hulvCuGj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G6KdLDTJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30548606A31F
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30548606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hulvCuGj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G6KdLDTJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o39O1166345
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxknWd2sQZ7e6sMxroosiyVGZDXHne6mb0NckvWbH0Q=; b=hulvCuGjbJz7dhCV
	NKTJ4uLEBNyHu6nmZ7t/Ra617NjmCzM0qLJIjbK8tXsjE7VqNY/4SjGCDLvWT2kk
	ljOTO5iVNYyKEfPpl/Ba3hB9gCc+5KHsY07aFKoENc6fdd4+haPYjHLvI1Kj7Myl
	ziuuSLZFlvYpQiX5F11XSxIqfQeFhmxw553lHHOie1veXSZCMBgUvrl/wwS0qlSh
	OEdx3qX4z4a/IQVrdrCODbkWM9DOZvdbdL2O++5oOjBBi6ysTe6N00fHyYPsF+Tq
	SFk1uabfQcfCo1bkbOQpLc8i50zHfXWLh+Ra8Yy/oCqRieOJbHB7GsVZHPnuxOef
	ucbACQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3gqbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c902e0da2so3082226eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837831; x=1793442631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxknWd2sQZ7e6sMxroosiyVGZDXHne6mb0NckvWbH0Q=;
        b=G6KdLDTJWQ6wNnNnz9Uc9P+aaG/LOg1Upj+vbV7RaVEXWicWiFTzjSPNR/HrwD0WCj
         eJEeDwMMxZS3JlkmjU8e3E8alGzn3D8iAqIje7104Wj0Hg02/FRtEfZj0Q6PsU3a1wRI
         mkIFtVQ76racTegw/NTJTWah+bJ3ELPP3naeACA7jgKw5zHP2Mm5JaH7lhE6K67s8s2R
         EkZv3o/NZ96UrMjvJbgfhg8FAcP/6q0uBYtWcXb273OSlDfv9THDcDOcYn/yKGy2VIiw
         rAhlesoX/if+5iwtKNggDxPnDmh5VFbtw6Tm8L6yvyOkbXby+hKM4HjjSeriB3xthK6/
         QFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837831; x=1793442631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxknWd2sQZ7e6sMxroosiyVGZDXHne6mb0NckvWbH0Q=;
        b=GZMDSuK91H31zorA0ElkCOnTqZGOaZgPD8EliskH9Fhq+gRIieaLtKE1XRsiMfRVXw
         tlNLWMoEd9+WVyYp78gjgmLoZBboH/YhdKcbpoMH0laumTFK2EeYFsSaqipiMib3Xf8N
         u05tH4dZJuQyJRZ2PJj1uBfIoeMEmUanITv5iPEhD0/19XCT7MRStSklTAxHeIW7302B
         F/BOyAj2mT6s1NX1EuEl6Vwd0FDsvuoKi2ZlN5o3FQvG2Yzh7AmaghyZqlGkgaMKlAIU
         2Da0LI3hC8xNaiPCzURnvz/46HlXBifT/THOdMzM/aeWdVyqLZvXuDVmNMWveJzJgQ0Y
         Dplg==
X-Gm-Message-State: AFq9FYKw42xEX1YpDafaOBNa4rYLSWDO39ljEWpUtDJmlaobBT5KeLnC
	4AJE+eJYpuUUAZhs9IMbGrqh0QUC6BfHfUP36SdpWiynjY4WJw+mrTL+ugX5ameDw3F7A0Wmauf
	/VcHxh8lpOLMPkaK/+fQtSdVvBh/k6NEB218pasqFsvWnnxkFJwQaamHBJRDvktKLVRQw
X-Gm-Gg: AYBFou1F5tJn+Fcdq5rwtFHJH90g/gUQfRAVM8ybCA59c6vpuqAvscXf9PC437ZK+L8
	vORbE63eGU8yLlCDpOEO4qrs2/kvy5MLulYuScgp5jp4i7H0hn5DUSu8Cd2ktWrT9yddE/f7Kka
	2gmpLegTsns6qN2TLU+ciKqxE6wfzXVT4Pe0H8mIZiPVyBG7h/e3S2edGWEjt7wzUL/ovcI5GUf
	D8SNnBKZzvEpCartGyttuEX3DU2zRjLyUYbFIdBCk1By3N8jNCx6yARfPc0y10BowKxy/+nj+rC
	M2CxU6QFWfSA5Pg6WuGYoKnlzVCLUHoYYNffjGgpChIuzwREpu7gkwMa/tP6NyAX64lCspm9CQn
	dUL8b7V6jltiUz8pG8QksKx0=
X-Received: by 2002:a05:7022:5f04:b0:15b:1959:15e0 with SMTP id a92af1059eb24-199344ccc36mr2134258c88.4.1792837830617;
        Sat, 24 Oct 2026 03:30:30 -0700 (PDT)
X-Received: by 2002:a05:7022:5f04:b0:15b:1959:15e0 with SMTP id a92af1059eb24-199344ccc36mr2134207c88.4.1792837830034;
        Sat, 24 Oct 2026 03:30:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:07 +0530
Subject: [PATCH 1/8] drm/msm/a6xx: Check BX dependency vote index
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
Message-Id: <20261024-assorted-fixes-oct-v1-1-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, stable@vger.kernel.org,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=1147;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OZgbZXRHjUVB0GyiAJm80VqQFl7KVDIkYEEZVJ4qf6U=;
 b=TZ+QZM18swWiIyEvnvhoEsmwG62YMBd4y5BPM3aJPn5Qe55JxWuo4bjV5cDhPB2ekv9NOHM2/
 ueliz1/ELAzBSCzQcN+6erugr+JWjcoqmwQ6oKnDzetS6RrPHB53BQy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: pNUiVC-l9ox9scHa_bbDtcC2r3GS2ZBU
X-Proofpoint-ORIG-GUID: pNUiVC-l9ox9scHa_bbDtcC2r3GS2ZBU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX94/45WWOHONQ
 Sh10LjaBse0waKPC6K7XhMaPjthuphb4tt1w8clnBn5yZSla1CQ5ZFHbeVy8BjGDARZNj9uyJQV
 wuUPe39GO7xRehUuFBwBV7LD0cLdXuw=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adc88c7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=UiV5_Nx6FN_ZUZKxJi4A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX6u/tL4QZftES
 qQF7S1kfl/5yTfnPStxLBGYHwiE/Iszy9UWTs6R51ORczp4+VU24+yUcYqx08Ba9+R+vX1L3hKL
 QnG3+wTkSmCu6jxL8fsiN9Rg1mNE9fTqgag4UDzsXOL39zCOEQS5/jAnUVpMDBD7qkLb/uFtrtX
 Rlfb08jCBwbDHQVIIlcgDOxWEVOtjrEGyV4iaJ9WMNFw2TH9Y8Q43Jd19UF/o+tzZVhUj/OzEDY
 SlJMG71eTGhAQXqO/Dwpylude7NzdirDlaVnFLxhI0kBgbsX/kYmjPR8aqKFqDsHnPC8dTJSBuz
 Qui3BOqIjAA/YVLk+aHh/k0IwrspANfHs3WjDDY1TWNkNksH1h46ArbvCcvXLU3xr5lUdmnkevU
 Nrps7PkuW4nYAM5/GdUpMYtHFhsqhR5CBOl48D2cT3MUmBbapDMKfV5wl/Llmu7RGGwY/y3mnLP
 zFdA5NzAX0o5G1LEtIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

a6xx_gmu_rpmh_arc_index() returns a signed error value. Check the result
before passing it to FIELD_MODIFY(), which rejects a compiler-propagated
negative value as too large for the field.

Fixes: 020b8eaa1db8 ("drm/msm/a6xx: Add BX rail support to GMU dependency votes")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610070334.bYvBJSpj-lkp@intel.com/
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..9e02d6f939af 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1867,6 +1867,9 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 		 * back to the highest BX corner if none is high enough.
 		 */
 		bx = a6xx_gmu_rpmh_arc_index(dev, gbx, gbx_count, gx[index], true);
+		if (bx < 0)
+			return bx;
+
 		FIELD_MODIFY(GMU_BX_MASK, &votes[i], bx);
 	}
 

-- 
2.55.0

