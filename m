Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486538;
	b=4YfcMnTKURBMvJAgtwJAT16N6bQdM4tOxZ4Gec/fzcTdigMblZHpU+vyaiju5pkmBerF
	 A2u98hT5Ks3xrPkqlR66H+FvmDOIvdkiA5ka+hvvJUo10FORi+/Zrf6qRT0QrRaM2WaO5
	 m9AGTCxSViV3kpCnLshHcODtreJNvchicPdTpKW4JPoCjw/GoQv3/N0Gh98ZM9vz02KX2
	 0EirOdPk0oUFcodV034lMtqJToj2uCRBYloV8cVSfYEZ6vxomSpduXNMyflVBwYixG2Hi
	 wndcFd6qaEBrtPSty6XiEHu+IWdy11tL2K7zzerZf17c3PIa0WwK3eb0xSVkuIl/h7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
	b=i15/vN0snWgqbDd50vDJzIZMICUGsoGhdEjPk4IA8chMQ6YfpEwQb/i/9OMwQ6ylBZC6
	 kvY2p4wIJi82kbl0JqbVk0dQ7RiZ6eE8ri18Ac1fG0n0Fbedswe4wH0RCK5NiozqERDvg
	 Z/oGGBJHkc1mqkVDErAv64k3rOYwUmGbSxbGwhyLZdlXuNtohrV/GBFoJ5B/B8GQXWKXb
	 W6DmDil9zgEijIoVGAEZmRtTSfhcu6fbVGPAg68nmBADFghGdN9fC+0RTt9IewKrHkVAk
	 hpkKR5r8sIdGkpeUJw521MU6UQG38nmvVr1KQQQZ3feov8rTVCRhNstOV+ni9LPAo/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lq9OmtAQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frZoj4nh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A1A606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A1A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lq9OmtAQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frZoj4nh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Y9su4178132
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=; b=Lq9OmtAQWjQWLZZr
	0Dx/DKwlsFqK3orkI4FgyxC3gTnbta6JEs7t/qgdeAOWs70gidsWXlO2rumnHWeC
	EKi/EgE/ydB4jYHRjYFIMrlTuMoXpn73XV0Vlj8dlwNAVyuR0D3dXf32gVbZNwVg
	dKLgv5PPaR4MVrmI5Uqb7J0gVfGwB9SruLY3FWrnfhtaje88yF3f7J/kOBBMC34t
	y9t/M5paEhMkUZ67CPPvhtuYIdLQvH7OcG7GSbwRQ3jZ+d5EISOVI2m+uXhtmFlK
	9Dl6N2ZPOb91u+R1S+VGECkXQPVLfji9TxArGXQjOEOsRVDtNxsRs/Z0VtZspvFR
	1RbaYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1qac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:55:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso5134331cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486536; x=1793091336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
        b=frZoj4nhqzNvHMqE4WDbRFqI7486l2SBwAkO9gDR4mxtRYnEKwPnFB3Ck2vNGXGACl
         4WYSJE/EQRKhZn6I5eSvwHJrJOgnmdnodasYRd3NCL9yw8BZ8pwgSNH7H9MLg/TGzKBy
         ckLjqVKVyXtoLEh/qtgdxKVOCokZNhMK1KAs+VrF3OcEn2fe9C6/cscUrUEBFe/ELTK3
         K+9840NoRqmt8JDVlr6ZwVZtsc3dTWab6vZsJOdximkkl0wyT+vupPktQNPIuZlSvDwg
         MumC+Ku2bRSxcJ0wP4OBXsfwkUg4JPHhgn121Dpfk4zYlx4QnwlS+HDBzUC2niWteqYW
         4f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486536; x=1793091336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
        b=uYh5bBXvVbWosPGUkYonELRWFjGj5v81VrSBk69wtST8p+nz0nDl7xVVjQY4dp+EOr
         sotxVJiEUam8p6AXeJp5TnxXh4fJILvpK/fQb4Fl3OpE2lMN/O2Dd7OMNkrPfkFeiNjI
         wJR/Yj7eDWnVe5jIUPpNi8E11qDoLoTp1uih9UxanzezjEKeCB9bG/Ycl+uTxhbYLvBe
         HEHGhGQFpdexTKoqAlfv2AATfkN6/sEAiF1BHARIAl01fO9AKgu5Kb+SiKqWShj74Nvz
         a0bIJOzwt2hFIlauJ9YE0xtR8zjToVRGDVTFApsKJz3Slc8nnink2uBIH9O9/uLOO5Nq
         7uIg==
X-Forwarded-Encrypted: i=1; AKwUvBx91resnI5N6IhRvoE4roEtlLRHr9dRfhpXbvmHx9IF7s1j++WvUm24dDrKbmJ2TBTjfU/L86Wom4tGVZaO@vger.kernel.org
X-Gm-Message-State: AFq9FYLtRF4GlPYPe0hYInxT+S5GnRYXaQ7lLKfvUM1DL7C7f2TVHQaN
	o4IBLfyCalBnK1anctJ6YIwT1Pkqlcb/W+oF756UBESt0praiz/I1bdlWvYtpJMmUOtxD7yXtEO
	5bE4HsKqFbnp9y9hPR+m+dOJtMn8ELNbiWvmkV8FsYtIsyqtNVdOYW+zsw+tCnKAPXogv+l9oX9
	8i
X-Gm-Gg: AYBFou0hoIrUicohbSndyv5rdv2qwTKU/SFCiA+63skF+0gNFyD+7rNJKIxCcrSVdEA
	dlDex7HimJ8i6DD4++vJezxis0EYSZl75CYL3xJYL4inY/CJH1jnugHupEgfychz6XCyfXmavxS
	K0wWQoJVQffd5ImNGv63GLRMHkJ5tNy6J2vI4LdPrmLI3zvwjWmzE79Vba5aLVHNobjTtdYuRq+
	13dFFh3g46rDHdb3mtrT92Cc+Y4WpOkn7WW0WQeiuxFfnX0ZlH8Wq1kXKe1e/yJs3P3XmeOxgDz
	RCR5duMb1uQeme9P2RYFuLnOTu3iuuxkPnUBKM9K55ZDnkF+EnI7Vhp8uqUyL/fywPHmlwBRaPy
	HcNl5bjr3ZX1arj3PFTqPdw==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1971178485a.4.1792486536532;
        Tue, 20 Oct 2026 01:55:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1971175085a.4.1792486535934;
        Tue, 20 Oct 2026 01:55:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b140fsm5189498a12.9.2026.10.20.01.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:55:34 -0700 (PDT)
Message-ID: <696f7294-8e52-4526-aff5-30ad022654c7@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:55:32 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: expose the charge
 current limit
To: Joonhoe Kim <26rote@gmail.com>, sre@kernel.org
Cc: kamal.wadhwa@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        dhruvin.rajpura@oss.qualcomm.com, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016124806.1789-1-26rote@gmail.com>
 <20261016124806.1789-2-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016124806.1789-2-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a5opB-qmtSleFBbuBZnB4xiQ2dYuV00q
X-Proofpoint-ORIG-GUID: a5opB-qmtSleFBbuBZnB4xiQ2dYuV00q
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad72c89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=CtmeqFu_9xN5vWxN5BkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX4pJVu89JEPdQ
 930p7zhDeut2/d1HTCVXAQs5840o4KDA8tyBKMNkhQeiVyGvrhf6kxDtWZcyrA6mUJVJiVgf0X6
 GGzUZibel0RF2xQ47U53Ki7liQXVCnsRYQ3ilig0psQqYC6T2zSKb326tfTepMEaaf1LSRVHoma
 rsXneaelhbvjl0+LxaX/eBSl7uzFbtxTuaZtoFwwpqQ6XJ3HelcWMbOYU7iTSHrT36HLdOU+bbC
 8e3O9f7O82vtRnHb5TiCJkTykXAJXANfhyTMKi54bkDaK9TeXgGmEvCQajn87By9PmgPjB2SyWC
 kFU16APBopS3Nr/sAe2oSFnqqvDKhYosGvgjb2qbXs4/xPMmxQRy6lMsMCd36QxkPfo3eqCd6NZ
 jtwjbS5rg6xxF1VrZ19zkRybqI94fPoqiHHTlv31vWjM/WsBxK2hgybTExveY+4A8zwrtjGrNiX
 rs2SUh6286Vuy0d2mTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX3hVwM7QAXaRV
 RA792b5kjGSiYrsBEBoG6jwYMkpP75UnvdUcRAGSdk87OFVPxRVR9hOPw9eAGz5Sk+9uX5U3FQP
 TaoQs9N3LOQvnX57DM5MlQpQo4bQYVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200035

On 10/16/26 2:48 PM, Joonhoe Kim wrote:
> The battery manager firmware takes a charge current limit in uA
> (BATT_CHG_CTRL_LIM) and reports the highest value it accepts
> (BATT_CHG_CTRL_LIM_MAX). Expose them on SM8550 class batteries as
> charge_control_limit and charge_control_limit_max, clamping writes to
> the maximum.

[...]


> +static int qcom_battmgr_set_charge_control_limit(struct qcom_battmgr *battmgr, int limit)
> +{
> +	int ret;
> +
> +	if (limit < 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&battmgr->lock);

guard(mutex)(&battmgr->lock)

> +	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET,
> +					    BATT_CHG_CTRL_LIM_MAX, 0);
> +	if (!ret) {

LLM suggests to add:

-	if (!ret) {
+	if (!ret && !battmgr->info.charge_ctrl_limit_max)
+		ret = -ENODATA;
+	if (!ret) {

to prevent a possible zero-maximum value coming from the FW
from messing with us here

Konrad
