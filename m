Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912424;
	b=Bmx0ZbX7CNRAymJ4AsDjk6e9FM+pbYfafrdQzNp2E4S946865OHFpQ26mzLkFJYu+MB7
	 mZlB2D/GVEc63dT6aMrjPcjLDMd3rFb16raGKltAK2UwsOL5Fl4VoLIl7w/QlPcDUY2P5
	 +2rrB9hyMGb71vbtG3ltuP6RKorZJEHPK7YWredWTBZPnbM+8rMATzC+Q+PQEC02bSaR3
	 AfDg0Rq+MaXy7q6fVzJ460STGPcho+gHU50tSRQrCUwYCp3LqQvf1bR4+5BfnKq2qj/2r
	 vhHhGAoBa07bif3dFQShe9qCVvwcq5vTPz2KrR+62VQAia0hDVs7d6OsW3v++4LFlVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
	b=GYGufalp+HcTJmr8oKuQbKi6HXhO7Go7I8w+yVGQrdct2UBZ+cLbrvb0WNw60P5yjz7h
	 MP55MgTleKl1AAd67OhaNu3fGofGea394WEIVGf4fRm9yKbIykRREdiwIsX9KyGpge8Ix
	 ZztfWlKo7HMZXdM/HtVp9SgGNGtBvg3fXto/dPcy5FkEh1YgvF62YXVth+f9UyZ02m1F0
	 uAXS0H79bOFW/vwaockPs7ulG+lIXpGuFlfVDUFb4noT9AA5odEJ7ORF16T0L4F/f8Nlf
	 C2lvjmRgYBbu/ht/hjRQt5PoJDuKmqJXuAH9BXrAsnVMKqJs8iOQ4gsSzJlfgF/yNEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG7faaCp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h79Kp1mK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346BE606A338
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346BE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG7faaCp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h79Kp1mK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8OBGS3624321
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=; b=BG7faaCpNM49oeVZ
	98k+QTU6JqdwQDU/yQ9DzR/9PmK3ci/tDVOtfKExdnjJ9Lweqcf3bjXI5lyFQ6Rn
	h2tOe2VXIdJ8mkaLLNmwvU5QA3dM624m4V8w8mc+eXKEpUMW8SonPCfftic+1V4U
	eiWpGi7CJzPozK0jFNQMbrt0Z4mgfUV3ElTsy8aHiyRit2t5ZsK2pGRfqopnOsgQ
	Q+sBa5siuP6ZlrlR2ZzWoC5Vkzz0DoeP2oCrBXOjiITPCIfB1K/vrjheUbkGkjfh
	YkAkxMeaZrugoTj8cIrpupd1uJJ8u9CPiWqOvN/7CShW3Y/QgUigpTyyWQDln3iE
	CN/AfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rek6cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:47:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so492115785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 02:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912423; x=1795517223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
        b=h79Kp1mKj4Ay9Bd3ReJ8yEP+bb7e2AmeF5fluJW+3eS73QF6dFk22YDkvbeX64exPm
         6nHFcfCr0orzKwp4vbta8wlkyxh/k9TKAzhQWiQ92Fo5NEYIUDSpDk1xPa2gzRy1AdHd
         P74/cjQhYhOX/YrwdcO0daasPW/pBYpfPvIAJOpYH+im1N38nOxIAmZP62Oz8G+A2t7u
         R/+84WocKYdR91bodEme4SPxhdECk8lyHZVzbIMBrYYP9Xu8EvKZ31VVu8buBm/oX6Ka
         Yi9rLfgT7XVF8E401lm4PHI2Wbzs39K6P1s0AqXulM5zlMIfHBLDCXOTCM84Om0aZmJH
         UWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912423; x=1795517223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
        b=u0jeBTo+aLcghyMVecaP8Fkp0NzpGfCa6VSlCbyy0WAZ5w8V8dJYAspl4Y2i7LEOUX
         gjOWer+92GkTf4kxymxJd0maXMxKYbzkqFHpuer27L1iLzuKXUXFGsaoiPeY72HTd52u
         7hwUwvz8ZsxZctV17PUxTmdb5y1WbvjqXm5huMbijCv2pIIbVSnHF8Kv2qPVXudRztRO
         4DuN+6ZgEO+ullJplYi+qC83W+lvvkRoj92ZlQluZDYTbAYoPGeDthEkhfCioAPPadPk
         M0o6b93bkUzPRzqfZgf0Yy/KZ04JqK7k5cpEi0GU9SFSgBwOq15yKNcJd/6KZjkaNZAT
         8sZQ==
X-Forwarded-Encrypted: i=1; AL+hErGRPO/md8tEYGAaWAzVAkgv+l5+89VxfCSPYdpO55Hl1MxN//DzKIKTTIeym7Q320Fbcx4x1i/mAmmZjK/U@vger.kernel.org
X-Gm-Message-State: APuU4Z8CvQuFpnMX65a4JNhWM2XJarzi9bJ+koMq+q47RyZAwMI0lPVJ
	SC2+pc6U+zy0d/hPeb9nVIC5edSl7oE8MF2nxR3AGzege2zH6KXjW5++Z2lXCgRtL6Rv4nC08Ca
	DRodXTACf7dZOyEmG7+05mBfoQA9HHbbsfSywIPu7sUh4PWWHFXhiyfONh5O2/7eMmc75
X-Gm-Gg: AYBFou3TAriuKLGrcZGrz9fsDqubDpENRi5LuRPs69vRVP3wIX8GkLm7jMD0MY/qmC/
	mGVwWm2Nn6z6O5hnx+ia+EJU9tKe6IVPpDYvgCdK9vHZ/E31A7ik1uvP0nZGczFrDfm61kTkux7
	49umPtx90FJRuYcGBIjFJa/Nc1bbTio/3ViFF3O1ufR5q/NtjyjoK+d554YnVN1RNn/PliDpSit
	0XxKYjrGsOXWyRjeNbX9KrJ/RcHQnkF8ArLcBRrCp5jE1ujOwmrP8O6bDcTXmfR8rBrMoU2Jw+M
	aOP0dA3kjgLqFvxBkIps9oCcxxcREOP1/s2oHu2kTxSz5G4HxIDrufhZ9kpwIJKdkGYkgJS0QJp
	4xE/hbsc2w16Xnlx6DlYd7w46xcKq44RwtOKtZYA8EzoQTEvD4kXLJiTQUQysetb6YJ/GXd1voK
	7otAfYZmAfxezbmSVi5L5WlRj2cvvho82bthtqPOKm/6De9LjwAjlvXJWqLEgv0UVOkON55iXDp
	a1T6UYWU63gb5IYyFAf2tym24o=
X-Received: by 2002:a05:620a:44ca:b0:949:730b:53e9 with SMTP id af79cd13be357-949730b61c5mr1289417185a.31.1794912422464;
        Tue, 17 Nov 2026 02:47:02 -0800 (PST)
X-Received: by 2002:a05:620a:44ca:b0:949:730b:53e9 with SMTP id af79cd13be357-949730b61c5mr1289413485a.31.1794912421916;
        Tue, 17 Nov 2026 02:47:01 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm119178335e9.5.2026.11.17.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:47:01 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:46:53 +0100
Subject: [PATCH v2 1/3] media: qcom: iris: venc: keep the crop rectangle in
 visible resolution space
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
Message-Id: <20261117-iris-fixes-v2-1-0b21201ab137@oss.qualcomm.com>
References: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
In-Reply-To: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfXwSLc6+N4rx0n
 7MCYI+PDDbyyQOrOtFnMbgcupUBlypkkVOX7TZpwj/OuVP03mgUlS5tVJNtsQWjCO+jDcoSq6Lt
 VXNeMAhRIUiO8+n9fQxRHoJ9ouL55d8=
X-Proofpoint-ORIG-GUID: -yQgZL81IQZGgH6w8mo3Tu-_DVfqHxQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX3eUqDBqaui2z
 d5/VtzRadnPOi9cBE0/qGkiF4nv2ajnoI8D751IXr0l0eQOT8//sDqlZKRaf6btAGo6e9KdCV+N
 8fJJBEAAJk6b+0nx/A23yUJ/Ods0vZifzcOB5PO11N3hFu/zhT06+rhK44b+Gu9pYKP8vpnMPDD
 FC6asmjjN1R2l6B+/dBVGc6UF/9dpmpI7Tx28dlxgi1VadtNthQrkmvjjfAH505gDqHknfvuwh0
 e6DkM0rmanJJXAC/yWqJ22bBVoAYSg2zMODX3FclCw2UEhnBWT7GSfFe0YZBWxw3dNvFtUSPfTx
 DKr7wiiiIWspVEg9+f4TPeIGA8i/P1OfzQR+OxVhx7K0lgBSSfTHkzT1iAkr9fR/KQ2FilQvORV
 2pQAJhqtEvvWaItn9QeN7MwhF22tPMIuZzzSetcvE3rJEqjR2r60ZDJQZyMQklucXVfVxxDeSn/
 zrxVrZN3Wra1BIpfS9g==
X-Proofpoint-GUID: -yQgZL81IQZGgH6w8mo3Tu-_DVfqHxQQ
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc30a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WErB8th0LOlg1rsA1XYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

The encoder keeps two source resolutions. inst->fmt_src holds the padded
buffer geometry handed to userspace, with width aligned to 128 and height
to 32. enc_raw_width and enc_raw_height hold the visible resolution sent
to the firmware as HFI_PROP_RAW_RESOLUTION.

inst->crop must use the visible resolution, because
iris_hfi_gen2_set_crop_offsets() computes

	bottom_offset = inst->enc_raw_height - inst->crop.height;

iris_venc_s_fmt_input() seeded inst->crop from the padded fmt_src instead,
so any height that is not a multiple of 32 underflows. Both offsets share
one payload word, so the right offset is corrupted too.

Seed inst->crop from the requested visible size, and report CROP_BOUNDS
and CROP_DEFAULT from enc_raw_*, so the bounds match the real source frame.

G_FMT is left as is. For contiguous NV12 pix_mp.height is the only way to
report the vertical luma padding, and the hardware is programmed with
scanline_y = ALIGN(h, 32).

  v4l2-ctl -d /dev/video1 \
      --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
      --get-selection-output=target=crop

Before:

  Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 736

After:

  Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 720

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vidc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..c55d2d905c0064c6d292158ac741571a1471dc82 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -312,8 +312,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	    f->fmt.pix_mp.height != inst->crop.height) {
 		inst->crop.top = 0;
 		inst->crop.left = 0;
-		inst->crop.width = fmt->fmt.pix_mp.width;
-		inst->crop.height = fmt->fmt.pix_mp.height;
+		inst->crop.width = f->fmt.pix_mp.width;
+		inst->crop.height = f->fmt.pix_mp.height;
 
 		iris_venc_s_fmt_output(inst, output_fmt);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..e3eaec1b7c2e30c065d8419ac3278756f70a8a97 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -522,8 +522,8 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 		switch (s->target) {
 		case V4L2_SEL_TGT_CROP_BOUNDS:
 		case V4L2_SEL_TGT_CROP_DEFAULT:
-			s->r.width = inst->fmt_src->fmt.pix_mp.width;
-			s->r.height = inst->fmt_src->fmt.pix_mp.height;
+			s->r.width = inst->enc_raw_width;
+			s->r.height = inst->enc_raw_height;
 			break;
 		case V4L2_SEL_TGT_CROP:
 			s->r.width = inst->crop.width;

-- 
2.34.1

