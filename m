Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CC46AF11
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627644; cv=none; b=Rxv2iCGavP9HkQbTfDtDJXHEZJmTrpVIYoDOytd4bhMPJaffJkGHvyePxZ0NDBt/Xwi4MR/y/xkkkj5BV7PRldfyrynUGPwGwdPWkf3QXvvzczVEo7OLbU7l58GyL++Vfv0WoH3ShsQ4wYWXpyPJ/FvCMdJ0lGh64FHwvTiNtWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627644; c=relaxed/simple;
	bh=WXUGAaHvZcP/oxO0DV+soJrpYB+PVdMtwrpzlji6Ipc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XG5KHu9sgAhrSgrKhd1cK/7RceO5QkKvBBGVhTGqy6RQnzG0vPfFwLchXMVhyLuU9X/+l6NkCR0Fg9n0cI+A1YjP+J9zOSArk4uyEijw85E1oSDK9JUp+JxjI5/+0LUSPxpEdA6A9Umik+HkEQ5cZLQzEyCiZuydh+lvhCvh69I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGjafiEn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YfYotC1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGjafiEn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YfYotC1k"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6Ga4K3978349
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uEDiQtnwF1x86R4MeL94Cs9fWflhOZR9a8WmLazXrU=; b=gGjafiEnKXg4AMkm
	MqwcnhClSb8hlL6HXKAIqDgUbb12QikfaXBdIBSADPCs4GVzCaunzvsZqJtCVoug
	NK4bn2tE/LNRDStu8RgSbdHDcYbl3tsfZnWiNxme8Xqv/eSRAEziowthRXDrCyLm
	m71wC74Y3AE3YOJ75SRdR+mSh16Ygztucm61unkUqL9tknRSHClWxMpeoJHazijk
	z89ZUgf2DrKzj3Vsm/KtLVQsqxe7Bf/SGkeaxIMYD9vReaOzlbHp02kTgQ01pdHb
	/z8kERd+wn5eOdYw2pUK2D+Bqkaddv1qmHZY+pgQchGjG6wq7Ja3f/CEuPhgW5bW
	Tp0F6A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv43tt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:54:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so19125909a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627641; x=1785232441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uEDiQtnwF1x86R4MeL94Cs9fWflhOZR9a8WmLazXrU=;
        b=YfYotC1kiCI6gaaRrOcG4oAfyf2qByYRoaudTKzNL4+2Fx36NVcgROiPHc585ddkrU
         b/wb4D98/DLx3vyPO37BZKbCI9n2aFh4AsYWNnpX/9mxdwonP3plC18VEud3qldeD871
         Lk3mrbdwNg21bsn1uxxUkAFG8iiKgSRs04o8D8vQMMOJx/lihZ95j6idkJAsWnK3IFLP
         Y5B3ble0TuSoVDsgl4boBw1jcwWggkHSvFGl13C5Ewp4rPF0xUBw0QDFoCS+oglEIk21
         aI/PgzOZ4GCaktaEFDLK7xLAxrbNUzojQHcPo7M/HUXo8Uec8w6XqBt+QCXNTPTuFlvG
         tQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627641; x=1785232441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uEDiQtnwF1x86R4MeL94Cs9fWflhOZR9a8WmLazXrU=;
        b=AceEImijypNuSh5jtkZK0MeztsIAxp+C9prF1dZVih+5VcHbfB8kdwxlknYGV9ePgJ
         lqBXZpXpcXnknDBcwELqqJjtqobXiIcGaoaS5ii1DYEg1k/bkSNOfpjm0tU3cpFGOY6o
         Ct2GpE245Q21Om9UI0UBLqufsPN7Fcpq56w6zuN6WbGiE7IbOmp3XlduKDqu0UIKu9RN
         GdGWEdXv9UC8jf7SgirCyLMgft8/oYXPDCxi6MI+oZvrjRaxHEibiPzfLPA0ewBGi2Mc
         Z4UPTpWpbYGAZEZZz1+J/wg7SDyUPn74pI+6lO8iiUh3VGrua6zZLxZRWZsiDaWLN0ph
         tpLA==
X-Forwarded-Encrypted: i=1; AHgh+RqaqvOmc3Jzh3HYLuZ+ZWBYENZ1KvVhwYj6ypVKq4T3h2gGmaw5LZZLZnmoHRg1Pe8NgnsJkTVWGkFHbbY4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrc69Pl8OLBpm3OHduNvF1LW5jqTm9O1g+m+ePS+Lrtah3i8C7
	7ClQ8ZF20eV1y46+CSn4YoRyzJE7V6xIT/V871vD9jK3pmInFmuRKMZV3aU4TrMjKVZ9fSS6CnB
	3aK8yxXvmO6XlBxGgGcXqN3yOT67bvjNXc+a0IRe0HpXhmCCCyPmqq78wt74MYMoQBeKs
X-Gm-Gg: AR+sD13W8vvoiXnJFH1U5gNvNgP4/PX/7YG+FCi2QojvCkh2ntHrSKxEjSrcYDWEOGX
	zLYZZ0dfx5Ws8D0848OisQ5P/kvTJoo/c+aAQ27pp8mW9Ewkcm+2hdxEzouZ2gEnylYdhK0syas
	N4FLjy1VOGwJ6Ozj8MEhOX6PRsdgMEXGF6LpJUmC65T1Gkf46Bomd3zNe2H4iv4Plqaxw9Px9bL
	v0djEdC22JvS4lzeIxe7/md/dX3yNoXUnz8Skck2G+kqJs4prPwQSchqjUU7Yo4IrqheyQV49iN
	gn/JfcQwP9CfQiLxnMtpV633Iv2HdvbSFINfE/x7KuF2tEcnZOCZtu0EgDftPbGcATwxbCS/9eK
	jsOUOosfzCc7kywlGABuGUiS3+srv/Yo=
X-Received: by 2002:a17:90b:2e83:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38e4b493606mr18184405a91.18.1784627640738;
        Tue, 21 Jul 2026 02:54:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2e83:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38e4b493606mr18184375a91.18.1784627640296;
        Tue, 21 Jul 2026 02:54:00 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92064c77sm1285462a91.1.2026.07.21.02.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:53:59 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:32 +0530
Subject: [PATCH v3 1/2] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris_multi_slice-v3-1-adc61a687e7e@oss.qualcomm.com>
References: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
In-Reply-To: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627632; l=1475;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=WXUGAaHvZcP/oxO0DV+soJrpYB+PVdMtwrpzlji6Ipc=;
 b=vs8rwZMxtxXyMgaTDhoUDVax1sXib64cOIogOH97iNepIw7SvwkEajjRNyOJA98gM0DisvBlr
 Lbtv8j6YXVWBsfYk3b/RNjLuectDHKOI+aSuTdX/qrDJv5QfaoA0HEk
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: wLapRyOaGlzewqWNy462pLG6EumWCrZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX0PderWe07yrt
 aPnituW0a24UFO9HCeA8vLgLveWsRlthib17uE92t3e86sIRRQ0/ERbu6T33bIt4rR+AOdLoOOM
 KvJuJTNUzXOTTxqr0HfaXg9xDh5JIrvajkU3jmsdSgnxOgmCFE6yHDpsxYrmT8M4fDLGowB6VAS
 sh95dBwX4JhXdutteRBLbO7u2qChDpZ/zxnnkJGY4skjbTRPcAT0G4Pvacs7z+FYF08iMBY7zXs
 qKQdEn4lJPxirHl7eN51yPuvsKnLGV/cFE8JGfIsO/yrB2xvUfNSLLpbh2Zgj/7fNT0Vynu8tJo
 sYB9glofSaE/lWTil1LBcJmyov4EE5iW2gRCVEw5QBLITgD9zyMQn1BCw9/Ymbi5JVXbBeaYJFE
 l77nDwbiGMcxFEqkG66qoyAmuNeKGOvY3IU5aruhAdrvvqqYBLQT4CpDawB2HBpNR3VFY2kDs5E
 xusszfdtbMs/dmCMSDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXyQduegbTcjZq
 19G+ZTcjYnOlYZOudkucso9Et0tMeR9GiA5KfZRmKzS1vwMsNPDQ3ICTjgG/k4AmIm5Kzg8/YgL
 dwwoW+4Ar2C3qSr7v58hHOEfmC84klA=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f41b9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: wLapRyOaGlzewqWNy462pLG6EumWCrZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210104

iris_set_stage() currently always picks STAGE_2 for encoder sessions.
CBR rate control requires stage 1 operation, so force STAGE_1 when
BITRATE_MODE is set to CBR.

The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
so iris_set_properties() would still see the previous hfi_rc_type
when iris_set_stage() runs during initial config

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..d7cbf6c3614a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -519,8 +519,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	if (inst->domain == DECODER) {
 		if (iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
+	} else if (inst->domain == ENCODER) {
+		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+			work_mode = STAGE_1;
 	}
 
+	inst->fw_caps[cap_id].value = work_mode;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.34.1

