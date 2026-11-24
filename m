Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502653;
	b=vATNRymJwfQN3HBABtIzMl5mnExze4+DomaqtsF7ci54VSmm4aL2g7iplEvuwr8S1rRo
	 Xft0C9pTIQxcGT6ja4kxUg/f+rxjdj36wiGpKj5UBanSSZToHTBlveF9R5Qw6OO+n6281
	 fqzab8RTQAmNnBKgFaJ4byRC1scAVln1fHNR3TALWsVSpNoE9AUWTRIDzv3bVHTpKAour
	 inAF3X1KM63NwgoNBUwUS97IiyGHxRO/9AHP/VQSpP7/yYieqEp331PqIJ+ux5tr/C+fG
	 Gf0+8W2AXpmprnJ4naj66qq3eHZAr9EigEFfL+DJYx8SFvZcokvYVadhJPn2FMdLxbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
	b=bsbk5g3pUAdRDlMBNCKgPHRYvmvOX42cNW7QSEpZ3hSbwDPGzhaP5FynQtYrTE3vaCAy
	 X3ufhTEDtk7gJNWG63ZA+H/XmMdvRIs/yhuVSdeS1R6dpkqDJhrScvFFkYSzC6smXC8uM
	 mu8LEzuP4xibvZbir4K05Y9NcpoN+p8Cs3J5RRxe8FIa75zYkG0QcW4gqHAOyYo+U2DKk
	 zUOAh+F1DZr8/5UOYx47M4xekhpgTKw1Jh3o8LRzFyne3GzaCDBjT02ky/d8ftPo578w1
	 r8OyXaMJXuLpaDros9U25/g1H1xuZk4VSD9DjqsAmZDEhz7g8CFlc6JXVrU1d4EIuuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KeUZzUi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EbOwuS4C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5781606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5781606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KeUZzUi8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EbOwuS4C
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mGIE4136090
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r0ByY2X0iY4Mpi/euGIX6Z
	+pt0UGNEDDDpkbV82aFgU=; b=KeUZzUi8LBi2ZjoH5n+PnElc2J7ns4yoGnGUXk
	30iU0Cw+cM0uidj1aWkDFexzRMktgs9pzNaYxLOj+MOzZCnNBVK8lZ1x/Sf+2Cog
	PbdzJm+t/SjepQ/OKITnPy9QoKyu/OAdRvUY29Ko6IeL2NpvrhhlYrlh84i523fu
	s19Kxt+KyE9OVc/6GTZpE5gx5hr9NVjcGO8YTdx+py7/tFSTEJTkBwVQS9ZXfKlU
	StLFVUFhsPUwkv3l/X5qV565+Ce4nqzOmAlRU8XNqH2SYWDv14L8IphNGfeHp6q7
	c591O6AqiVWDwbLjfwBmY7Y9sE1nR2wODJlhmQuLUgm/rr7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpg6bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313c7315becso351314eec.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502650; x=1796107450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
        b=EbOwuS4CtFRUYv0ASVyl18hgBmZWbjXl53GMgLRtstSVU0uOTCKXFJ/utAbp94tOSd
         qLu235uuUqB2wsP+DNrRZsVdjaSzs2Plp0K+hyB5l7GbEeZ6k0/CK79pzo/vNWtBkagX
         FeKjwv+be0OS0kw3JKqvkqPkPjG4ZmUT7Iv6n+2022uYfK+IpsxGZflQnWsxbr+kwW6l
         nyev3RYJXU4tTrZARxrbw7b7YyfaM/VCDe3z2TvdKJZ8aZ9KEmYvAxUJxBwWPzv/7Ri7
         t0yoGrwCSceW9fqQj//xAuXCuzeDp3VvykMxW9L+qSorfry9jbkvAtmIpAEa7zIRzAUr
         lvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502650; x=1796107450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
        b=zND5kjnAz0+6HfvZ8h2OxCsPOiHitpFgbJrOVKITswmp7upkBfaxEF63+MZcgmL0er
         3qCLh27iEkl8MjitCJOzd8fp/udUnZTER0ujMWJsydEXld09tPnvzoHO/IRip2NUWa90
         Th+Tqq/cE4oRPueMIiS73mo22AM8bdtkbgTOIV/ek9oFwjO6XFpm8YfViuOCzvgH7oCy
         hhe/rcyIlRx9DWMeJJRN7K9tpsVffgrzqN3fQwIKizU8LzSOHMGlTiBQvAadEckw3uNY
         zvKAkSpv/k2o0EKlBefyUT9bUSlgdPBWWAuVqGr5dS5TEPoPU1r7aSDgOsW8zkWMJAHo
         zS6Q==
X-Forwarded-Encrypted: i=1; AL+hErHXqr8zsqNYxhzqiMstEkhI+jNQ+eSm01O6D+t/NAk7Tly2ZZxHN7Hr0lnopQfclPLCWoW4j2Gmci1IyzIC@vger.kernel.org
X-Gm-Message-State: APuU4Z9vjzTi2V1i5dX7T8zcQ+LyDAj3wy0SjPYDQ87YNNThVuPvl1RM
	OYjanTtBKycIMUR5J9O9ahON73Pul0cQmxZDuXMLd46HDZxY5+/ZTmoxUh22KG5OVvsT/leGW5X
	iRDVouw6lH+AsFpaXi87Y6AnNXSCp8kSc2+LYgnFtH9yTxP8LxsFlEG1uhCOyqXaCpFhL
X-Gm-Gg: AZFdTZcoPHgj54RzVoBMsbT1JDMZsdBE9Uf+O8z04bCvn9itaRkZMO7ryFFrTiVplC6
	yct/e6OsiE1BbFYbg2pUdEEho8Suw3Y+Kpn0RHe11ekR/Oyfu7fO9VYIHOFdwl09+jWMh9mJL5E
	z0oacxILBc+munxzpP9fB3gbkYSEORYnJ9zvv7ODyP3kIS6k8GBaX2b32R47OTSbg4+dH9KPd0O
	6SfB9/L/8ImwusHxjvCbSzRe/v3uV1hXdw/QcmaVCZFW88a4eo4EnMbyRawolQHxV8SKnUnZnq6
	khjrj9jWjPR2/mmqGcv5h4ALmZW2CejKIlUJvEnB/9YDBR4GeM8p8kLUcibhtJfN92JefEMkPZj
	uH9kBoCVtCqUyb2zFrOGDwwV4kSTEWhH7QKtb8syicT+PVqoX5rCJKN0xD4VLcwSt4yolR+lXbW
	aJFlA1NUpkt/S03dBlnMPM2c48egL4qrXH5A==
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21860128eec.2.1795502650344;
        Mon, 23 Nov 2026 22:44:10 -0800 (PST)
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21860096eec.2.1795502649741;
        Mon, 23 Nov 2026 22:44:09 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:09 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: iris: Add support for mahua platform
Date: Mon, 23 Nov 2026 22:44:02 -0800
Message-Id: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADIyBWsC/32P3YqDMBCFX0VyvSmZGI3Ksux7lFImyVgD/mwTl
 Zbiu2+0lwt7M3DOMGe+82KRgqfImuzFAq0++mlMQn5kzHY43oh7lzSTQpYAkPMBuwWvPvh4pRF
 NT7yiPC1RoVCKpbufQK1/HJnny1sHui8pen6bbKAY8Yhuss89WdSg+a1/DkvgKwAXnIStjK1Ba
 SW/pxhP9wV7Ow3DKY2v/Y3BSHx3/NxkwtVOONPK1jnbtkVV1K6UOdXCos6tEoWSuiRgO1Dn4zy
 F59F5hYPon3rrjmM0CE1gjUX8g8Mu27b9Atvn5X5KAQAA
X-Change-ID: 20261113-mahua_iris_enable-8e3026a4a044
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=7521;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=gUE63zVZIVeUvmErUr/TrSMTqv6lxRJ/fp5Y8KWuPVk=;
 b=Y1VZuEAlW8OxZVs/P5hijwld5rvuRABQSv4jF35P3GPgC1wI0Liyvj8dL6a7vzpi+OfR+zpU2
 uUCeSoFky6SDjvqu3IcD7+jiVH53dEAGSc6UTU98lk4nfCTFoXJT5nz
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX/zyLXzTyDTNK
 9RVNi+3uILGjar7e6S9+3t7jyals5uktn18A46/DXfcmMyD1ZS75AGpd8u+b+Il2mD67yA8DqzO
 xIl1eMchMK0/q4Kfp1rO8h5+GFUgr/59gYztYBfRQFntoMglbJcfvs5gzddKVXgpJJF8IMylu77
 Fa39umZOQP+4ChXX2AzSC/lJ8aRQDEfN4f+XJ4jrSR+/VIdSd3Qqf1ae1wYdB89t6S7B5yfEZyS
 3j0Ph3MpsK6fzW8Y1pFItLrbMLiNICXEDcim2MjF9aMRVCUU7F9tY6xgAMUv+8OkQXXyxoywfK3
 mZP9p+9my4WLlWHVyYC+UyfN/79gHua5u84/lJ4O1Z29ncQpRlpMqU/2w9gY44PQeGG+tv65ZKn
 ZFE8wVmP0enWh7hiGgi/AhMGkQcMYT0/9zF07ydOffuBkSALVuzJ1wbau6SSY1LKkPA6rAB34Fq
 DF3qneQWc1rNMYZiSKw==
X-Proofpoint-GUID: 6QbKcY2GgnI-WVlC0rplRDgx6RwsBqxs
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05323b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NlngLaH3A2d4KlUMbl8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX/VvPw8NSRj9w
 2S5R0OsSnXPkiciG4jCiWivP+ZrjFF07S21sKrbraYW6w1FPxPm02mn/oihgomB5zQiZYY89czE
 bzmGfUPdBM6/9scyb6boIxmMm7DGLig=
X-Proofpoint-ORIG-GUID: 6QbKcY2GgnI-WVlC0rplRDgx6RwsBqxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Mahua is a derivative of glymur video accelerator with single core.
This series introduces qcom,mahua-iris video driver support.

This series depends on the Glymur Iris enablement series:
https://lore.kernel.org/linux-media/20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com/

In particular, the qcom,glymur-iris compatible and the corresponding
Iris driver is introduced by the prerequisite Glymur series. Therefore,
this Mahua series must be applied on top of the Glymur series.

This series adds support for Mahua by:
 - adding the qcom,mahua-iris devicetree binding
 - adding Mahua Iris platform data for the single-core configuration
 - adding the Mahua devicetree changes required for vcodec0
   clocks, resets, power domains and operating points

The series was tested with the prerequisite Glymur series
(and all glymur series' dependencies rebased) applied locally.

Compliance test for iris_driver device /dev/video16:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : plat:aa00000.video-codec:dec
        Driver version   : 7.3.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video16 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
                warn: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(2223): Cannot test DMABUF, specify --expbuf-device
        test DMABUF (select): OK (Not Supported)

Total for iris_driver device /dev/video16: 55, Succeeded: 55, Failed: 0, Warnings: 1

Fluster test report:

77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
141/147 tests passed while testing JCT-VC-HEVC_V1 with GStreamer-H.265-V4L2-Gst1.0
234/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
200/242 tests passed while tesing AV1-TEST-VECTORS -d GStreamer-AV1-V4L2-Gst1.0

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v2:
- Use iommu-ranges instead of memory-region (Vishnu)
- Fix dt-bindings (Krzysztof)
- Fix order of patches and iris entry order in mahua.dtsi (Krzysztof)
- Update to maintain alphabetical order (Vishnu & Krzysztof)
- Update cover letter (Krzysztof)
- Rebase onto latest linux-next
- Link to v1: https://lore.kernel.org/r/20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (3):
      dt-bindings: media: qcom,mahua-iris: Add Mahua video codec
      media: iris: add mahua platform data and enable qcom,mahua-iris
      arm64: dts: qcom: mahua: add iris video codec node

 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 200 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  67 +++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_mahua.c |  44 +++++
 .../media/platform/qcom/iris/iris_platform_mahua.h |  14 ++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  33 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  10 ++
 9 files changed, 374 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20261113-mahua_iris_enable-8e3026a4a044
prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

