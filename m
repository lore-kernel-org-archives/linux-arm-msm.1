Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031910;
	b=gAmeOXMaMoBaedS2hjjCFWDlM6GlOLhLQlMRiq7dnij9pK8+MFD0rwZXMwaDk5znqY1c
	 /UcJYGKjbQcA/UaVxiDE2eUm8ZcBJzfY+j380CuiNisBtd8Kc+bjE5LzBdwdiwk8PDagf
	 en0V7zJwUEP9Z9HYNwJnf3py7T7qMhgyQUdaFL7Wm2HVRhY+GB4OaCKhtpTyksQ1Zl8Y6
	 NbEmp4zCRQdgrBbtB7vEvdNvd3rWHFVxDlq3JZyXNlnMqdIJ559h2SeJXa4n95sN/cWWz
	 P6/jelr1dOT5ig+1Xxh8w3k1I6VXojF2wskAricCpJs+ak/hic+5JLHxjhJi9/z1SMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jQhr9lcUbtOHJ86m/KkCxHTKxuepW7LPuoeiISO1Icw=;
	b=oOX5UQg2kA8+CckVhB2oJqHfwSXY9maIo27s1Lnkl9p/UwYaw23i8geMT0CnDH9xmhuY
	 ++bprfZh4gNH0X9xjADvxJwfX6aTp4YYNMTgLvLVveyRsCZVX5WQoo+n83TmBb7qzlmPy
	 P0y118gfIw4evk1CpoU6Ty2/j9cRXrPexz8mH18xBGS+Kl4h/FnB+k31D8V8yAgLDJ9vj
	 5/c5fLYnz43gTeBEmfX9YN3UrOq9wXIs3Z17H2L6RqkvVQKEWTXiH2c4/EFdt5qw1ULAc
	 SLwoDnJIlx8h3Fn07baAGigItvMKzDn5DFdFoGCkCFH6AY4J6QaDLf0sYOSpHqkCgKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGepJCXo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJVDKHhK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5683606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5683606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGepJCXo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJVDKHhK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEw6qX3584353
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQhr9lcUbtOHJ86m/KkCxHTKxuepW7LPuoeiISO1Icw=; b=iGepJCXooAiw+zc1
	Huemi/iNRPb3yDkHY3X9TfxGus1tyESpzHZ9wzaHLbF8VjhCdLqS0tV5eyUHUBHG
	sGhuTflT5O22/oVtmL6dYI3ajmO2PatgVp1LoE6kYhOc32E8avJdTDIZXgLr+f3N
	LVhUu0MVrVVXrWP2Bl3EOsUvHzs2Nerqw106MLqYh+V+opRizouOViRuni1/PQRR
	ebSI8bv+hwZS8pc/6ZgOIUSPkpfygAUkEw4LUCAUl7xrubBTqHr6qWJU/gVDbcaL
	ocTCxuV+TvgQQLfPGmDDRGH9dp0K55b/BmJqThrKCHMMvpm7TiZ+rJ6IIUUa4LiJ
	xHGLZg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddb2dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:25:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b92acedd9so58338256d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031908; x=1793636708; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jQhr9lcUbtOHJ86m/KkCxHTKxuepW7LPuoeiISO1Icw=;
        b=gJVDKHhKDJulQruzQKcgxqkklYg8gYbB9rfWKpMf9PwJ5brwpY1MQfonfGGVkxRUrp
         aRDmKUsidgtvgdlmb6wvs7siVrkoRufiCrrDBFFvtZeBu4Eljg7Hbx2I8wbvSOuszHA6
         /EUdMaBEXCZAJUdoxH65jwuNf2A25ym9hBeX+Eaz/E5frA8AGUBtIdUWcupim8/wuvl6
         Q9caP6OzWcoDU9aH80hercXVpXMOLM++i9yRXuITONKrVZq+DDvbOpRZoCLU0PPvJ6Vr
         TDg4kGwhzrG/vK/Vkfm1fnI8wm2qT/0YcZM6GYkSTCVHhc4WvXn4XkxcE4IDar7KECrO
         xo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031908; x=1793636708;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQhr9lcUbtOHJ86m/KkCxHTKxuepW7LPuoeiISO1Icw=;
        b=2U1jaF18wKIflvBClo4fbxnlel2hjnQ4B3WtZxDVgVwk6NpSj7zPCxC1ubHrg+93Yi
         pp2mOKCEyY3dzilvbdVy/0wQHNINENOFarNhbX+COdpA1/2orGYEvAvpmqPCNr3EmMGV
         A15nqf5ggZ7XR70tcoe3k5m557ldyGgtbO3viXQU2BLRKgtD67e36Q+/0VvAowjsqLX2
         7MyTZdBxXFeYlB4n4RouyZw09NFwxNmb7Gd1JPIIdClldaNfWL5fEzMI5ZEFMedKpeh3
         DFng8vFtBzQf4+lo6l2HzAzfOHV2Nyc9L0hAkrqyH5yfPA6+6q5kuaOTBckJKlv4HwXf
         3wrw==
X-Gm-Message-State: AFq9FYIb0yz5fVAcTwNMPZxRP1KYMU+bSBLTE3waceHngluA6IhVjILZ
	MgYz8YKw8mqY7Aqnr8tID5mnKosXE4yAH9rEH8i2ClcrpLUMsRDDUeJ9Bk6HyW6Pa6S3so8AFtS
	st1N5edp84/H7RlKMV0QhuZE9EYAMsEFLRGSfX6oAM1/pktn4tozrTVh3FI32fA66TaV3
X-Gm-Gg: AYBFou3/2/PeMTgE+ExbtzdIaRBN1YGYI5fgYUbLh2YMEygD8Mb5WaMv6GEGYoZj9Wj
	GMRDqBVfPsZ/hcw3KoNYP+9rxvinscm6LsKlGJCWBSQYYphSm4Cu0NRxPuF8/sXUZ2bPhNTxgtH
	LepeJ3DUCLJjQ6RGR3PJfykkzeqfi6lJX+daNWhlkbi4ZMFkJpZYGULlkDnOKlb4NcAdvcttAW+
	n2l75gM/7IKVTx3Pm6i6IXQtoLYphoBjk9UFHBb6PWWmKOq/XefPYIl5m6QACKPYHAlADozf4IO
	zUsN7TKobvhJNaMeZiv7kwTtvIsWeNwqP9Pgr4PYgkfxAcPjZi79Wo/VxpZ1ApqBnrb6RobX9Im
	F+hfnso8m9g==
X-Received: by 2002:a05:620a:4086:b0:93e:61ee:fb01 with SMTP id af79cd13be357-940ef8af1abmr821812285a.17.1793031907648;
        Mon, 26 Oct 2026 09:25:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:93e:61ee:fb01 with SMTP id af79cd13be357-940ef8af1abmr821808885a.17.1793031907073;
        Mon, 26 Oct 2026 09:25:07 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm241739015e9.1.2026.10.26.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:25:06 -0700 (PDT)
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware
 memory reserved
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Roger Shimizu <rosh@debian.org>,
        Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20261022085844.768508-1-m.szyprowski@samsung.com>
References: <CGME20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97@eucas1p1.samsung.com>
 <20261022085844.768508-1-m.szyprowski@samsung.com>
Date: Mon, 26 Oct 2026 18:25:02 +0200
Message-Id: <179303190208.155514.18251297146259001026.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=264;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kPpxmU275He2VmumH10/JAoMY0W3HC1wBCpLGc9ZLV4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq337gIxz7JCyBL3ZVRLAhjmmyigAMaeARtzehR
 y4lWFBKn+SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9+4AAKCRAbX0TJAJUV
 VguxEACqjGDhayRa8hlel0+60V4P2s7dQv2KsV7ePiKPwahYlVhG/g3ncjSGqsD2dZ71gZ0dnec
 /jf6aGfFRio4VwfElakCy5m3b+UepLxFsYTWltNU+zYtjCw8NzyscGLEWj3ob1u6vdLGR7xZJ9b
 3nbsDT3PDMUuaGt8bfD+v10IFVHGvWa7Ull+Y7hSFwn7z75CITVaUrkyDQIvj2XRUz5X70VS3qi
 VoE6tAVUfO5a4i+IJSdI+PDbj5X84wU3/R+adhIbCH9Pylx2Dd1GPzVe9RFabpZia0jJdJrXCb1
 O1g/b2vDBnwNaEMHnjFu6H8qCrA756vnwB14anpPzVDg3ybE+Z4FPoy+f6zaMywFfJqudwp37sK
 7H3JbXMASP45zKYCUL2w60HRRcSnpKRhfna4UT43409XyOJ4HyGUPULlFmlFQHtUMHkJ2AAevTg
 F+9KDaFE3oNLEiyCgTX269scBZE4NbS9ti29Y/sugQjg4+AjgXeG904QhUWMkABTjOsaafPRv0+
 Et1JudUyCSsdjbA/twj8SmUsvAUOF/JPMw/gYszP3MRVZSEYdH+Mz8QNEdt9QZX0ESsLrTrceUl
 /kDQcpBvqvNj/qic/Q2V6P1UvzO+4LaAxkiyIONor1Xbv6kNnGJ8t6m0uq66u0NwlzKinbydhKq
 S65vUw/qis472XA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: cTM1uTUWM1im0T5Bmr8llOS4Aus0uQCp
X-Proofpoint-GUID: cTM1uTUWM1im0T5Bmr8llOS4Aus0uQCp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX77H6Rr6wms2U
 TeG+FsYd4+e/jom6X0DkgsAb4TzG4CED/Snakd7knJaU9oRPwTFaxfI8wokoJ6AmMmDXcKdp+zZ
 RwxYBgwsQ1xQoudkI6B2mX1045LefRQIUA/lpNWQ23zbadea3ytdUepw3WDVXnBg8rrtu8WV0fd
 942ARzaaCqO88CgfEDu2E7K0JueHi8nZ7Hl2ov1e8kpArh7kZwKgcLtg2Oix/xcvVF06JwHCTgQ
 yVxeVX/mnBA/Um7nZvxAFQOtHsfdy6jpv0s0cztnLVBUo8kCsk0xE7Um3ZGz2MvU/jUxZblyiMU
 mUypy916svM+ea/HYYrF5yHlTSkTRYN7ay4DdgJpHHJN6gGyPew+1GUDY0BQxl0zXxSQSG1peUF
 SRPJXPgvvZx83cEiaXHzfQNM3+bumorlZvaNIbESFrBF8HeXCVyhAHvAXSkFawjX0AJlfG5gvJQ
 yihMaf5NgML/vmgBx9g==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf7ee4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=HPxN8h9JYl6qewWKfvYA:9 a=QEXdDO2ut3YA:10
 a=VFjOIfaMTjYA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX/+JtQkpVeUgn
 eKiB5i+vNjFa0MwpEC5s8nKUVybvt2ZY5gmXqcLKO9fnPiPzfPfMNJiRcVqaOuS4UBipM17B7Vm
 Zhf1vEoVT8efe0eHWgB03JJ5ubeZoB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On Thu, 22 Oct 2026 10:58:43 +0200, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware memory reserved

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
