Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010114;
	b=Z464DPaLne4ec3RsoD3Cl4g+nBsQ0+LVTftoAvxkEGIYqZMCTsC6Rtrca38QH/1tYOua
	 PrBxz62Pl81UIVdtmw8N6ba8J1Izw0+UEx+SNWdhu9DSfCFWhUHVquE38WD32cOoXM7f8
	 zeFUihlg2EwsqervMHLA3D7z/gtETvEud1D/Oj8i+d3Yrhdeuc/dr6zlpCy9W7zczvgik
	 a5Om+3ju4NtLhiGRFtSVPXuJLDD3uTP8eytpVbnZkzfXxkNLU32WnNfaPnl1fWtys5uGc
	 Vo3qmItMidBaLV3xB/175tFxPQw2adrjnFAGCEIg8xQhq+RASmJl7cyIjFmxOmA2HjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
	b=Z4wsgHNiI1deD4WOAZ4Uu2l3KinDx9IMM1n5eaXMTMW6l+spCWDlslfbqn6VVO8f04xn
	 PLDNmFl7W9MDAGo+38XuncazRaRIF+Ga4t461IjTXbkcGISLC2YswszXNnpvSht17IFqx
	 WpBQrZlnRR6dqUnLbOQ9n/iZOaO85O9MgouJ1LVUJWJK98SxvEMnxjJL0ziW3gYQGG9gK
	 ITChCJbCEraSfOH2wymDaztResi0vs8VEoNg5o0aZURoNxa2Pg7AalzYFjUNbE2lcTN86
	 Zu1qAVERL50P2niPZGTJdQFsfKUsxotGMUFvbk+doY9JfJEfRagIxu+hG4Xyuf4N6SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BgsR7eXA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BEcnchRr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D9606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 525D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BgsR7eXA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BEcnchRr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auSs2255122
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=; b=BgsR7eXAbqQXSPx/
	N6gDFRCOc379islQ+jlox+GxXIFV7+KYeU0dUMR1Fg+2vKAOscZDwx8fI5za6FVb
	tmOeyTwsF+nKgRKB+0wBhVJncGauRmdKXy8dRZ0w2svtnpoRDtthmsIAzeOMnnPX
	m4K+d934e4xoGzKEzTVU0xf4HMML8ip04I2vXaNqStC5J0cO1dEkCzcHW06j0tPP
	5QhTTUwEhr3i7nbSi2BFlYBKknLKTsL445cKA3IcygypPUxy9Mt3hNNeHn+w57Jl
	vfYE42hJpai+5RKzYyk3BZC5VHAXjTibxYzQUeDkVum2eFKdsIEQwh+AmlrxvhxE
	+grsow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3nvn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:21:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso720979585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010112; x=1793614912; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
        b=BEcnchRrdTw9rOa9jKwF/u9svRAUiw1Qj8JKqNidOn9oCrhKGd2wKpNJhbqBEIcuZO
         Nx4FRP06C8jna+fSdWjgDS0iPg+lRxyUAH5WDnZv3dU9DJlentsEyNBs03fGXVpXsvpv
         VY7qYgQ7CI/r6bIjLiybFmHNt14uzhradYtJ3s1rENSKGMGHdBQ7+YZ1ENRdqyMiUI1P
         ONGVAvGgqqsSc0bLIukhUj35lZW+ZQ+GVu/t7LceWdAe1sswqOruSX6o14vO86l8aQac
         06H/nhocX8HC+TbyXvr16ZX5mmfofyFszSG25jk6xSn3xxCZfh+BGEs/nVDBJW0bCxC+
         xs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010112; x=1793614912;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmGwnrdxNCjGaVUznght+WyNBs3X/bVAjcekB8cqWIc=;
        b=lF10qyBT2Wrsi1VSNZVh91qcEHmsogcxkVwpfehhzfpeh2Y/U4isJ0wzUtyU+wML6J
         8sWVsQYlilREbjTKc/yCus0WUQTsR6Bip9RiBh1qq2KLP17tTDtAeEXSoA/G1sb6cO1W
         Oy3UqYAHj+8MQDYLqNMjOncA7rHl5J6IA8EOzq9a5g0ebqoDMiGxP7RLpvxW/hCzI4Qk
         d04WCnnMFLz5i8oOIQCRl60cXZwnU+n7iHqGSH72E+bs1+AuMMKxSk8VEhLXtE2/lSa3
         Yn0fWypdXx9BUaB+h1FnlPXsTgN6So21wK1iR2LANeeiQlhwwmJBlxO7FUbFS2rwZkVE
         Jj5g==
X-Forwarded-Encrypted: i=1; AKwUvBxWDK2cYn9CV7EYho524OK0kV4+c3GDezmAJFhK6P44ceIwVVRQLdjuxk47af0C7NHIg4X4Q0Je8xlEt7An@vger.kernel.org
X-Gm-Message-State: AFq9FYKIpBuzwpqV0Ops+jCH30+3/DBb67/Z1RIgUhKMdtePYt5XpPs0
	dyAZP6bQUVi9s8WkAX8i9WyViZinjxmM5rxOsf+1/cvulHb0G47jrDwgOBeSazYLSi2rS6jljwG
	hN/SdlNARQ2LvA0ZPyanceHld0BjXsaJp+fQd2bD2URH3rwwfYup4Spp+ddRrqF+hsrgW
X-Gm-Gg: AYBFou04YFeSggnvurOKszf9FqaWvbYqYR4a0EjkBCgOZlWWgIulkpCpclXQC2c6dXi
	G0D6VbnKMvgCAh7S/Pn8B5rL/79SoW8nv8WhpZaSxtUMOJm64FYInJRW3Confe9M+kalINUtCjE
	bfhFtt6BXggkUKv0EYm4LOrOKMIU3D3TfdEJwuMWvmrFutTENMV9VbSjH7uyJtrwu4wq/8WlX4d
	jUBOE7p8zdRZlt72hW5JI+HbXbOA9Ls2MCnfsnh0RaUHZdWcx7CdpM19G33km4/94D7T8GIGNrz
	3aMikuRXvz7WEvCT8l7rEzRyOWsRpTu7dovs36SqumTKsCBrf8xbdQ0ktxI1JMaSAT5qo3dc3by
	KZaoAjbRDig==
X-Received: by 2002:a05:620a:31a1:b0:937:6de8:b40 with SMTP id af79cd13be357-940ef913c90mr835634385a.15.1793010112282;
        Mon, 26 Oct 2026 03:21:52 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:937:6de8:b40 with SMTP id af79cd13be357-940ef913c90mr835628685a.15.1793010111647;
        Mon, 26 Oct 2026 03:21:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm196226895e9.15.2026.10.26.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:50 -0700 (PDT)
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
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for
 HDMI
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-2-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
 <20261026-topic-sm8x50-next-hdk-i2s-v6-2-0bd654b8388d@linaro.org>
Date: Mon, 26 Oct 2026 12:21:31 +0200
Message-Id: <179301009154.3833661.9148622566622924374.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=297;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JC2YD5MuIOA9sx0NpsUNWZGDDwPM/UnizCGrAm4vkVc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq3ym2Q2+qpQ4Qr5hCKm2L9s98yTk0C02co+ca/
 3PJgw19G1iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat8ptgAKCRAbX0TJAJUV
 VsqpEACS1GPIBiYVuahAsl+I795x3GE9AmTvLyACnXo23Zc0WrklpM04UH8049/N5jvw7lNI2/b
 GZ8XbTtmzIvrNdnle+YxircfycSNBx/dKGvw/q1SvYQI54pNWVDwqP11Tc8EKVrB2rW1zVnDZgE
 hjNZqjQ3DgKFmzxBooRpaZknRIgngGWhgo6ua8YppN2vY/wXwgv1snq3kEEC39fIbHVN2lF2urY
 S6+zEGHPvWzjyg4GdGuV/cdtBRhvMy2Tva8+N/usKy2itYcVULQ5J7nYS435BA9Lek1rIv01Xvc
 3f53DjMQHwupuxjQUBoImeSvgm/Gvj0xY+bW+o7/2ktWSeX4T9wFk/6WVs6C/bvRHMrou6iGMj8
 eohplPcGg55DfACV/rE0JUC5Eg4yVO8GiF0QtdjKCY6Ycx8L6j7ghwiy44S9CuNpyfOwTOzxlnp
 Pu+G+nPNiMgoWCzyU+P7K07sDl6Ulsk9WqprL5MsNzNz9gjv4HtCKD6I2vIsqzN8vK3PUPUOkHh
 YTbu5kS3iQ1zfI1p4FPVFvb1030y3rIDDMDd7epkAtJFlXcliL+oYtqNyxQTo4X2AHCCsnOwnB7
 Mvt8skrGjbjdYsrzSh9fqjeZf7JwgsnzJcFni9AO3HcwF0us9JKRafVeQZaxxEaWlvTdedYUEkt
 /nE5UmVLSOVXchA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: V7ibPh4woJmIYqLEdzmCQJ88cwAX7t0C
X-Proofpoint-ORIG-GUID: V7ibPh4woJmIYqLEdzmCQJ88cwAX7t0C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX3Y8+rrgHigUY
 WRlyD+0SGfx/HdM8nsX9i1HN9LHZmLAOOzKAh9qsZaNm1invmTSlUNcN8AKES3t/FkCcrktiykB
 NHx3rBBkNzMQpw+Hgz0uIgbetEKum7s=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf29c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX8MMEYf5cTavJ
 dC8IEi1Wt2pcjcw27nB8gINLfujC0vH940ynVoL8jBp69/6qZJuqCZbS6bz7QY4xd7ip5SnuEmU
 POx+dl6xuqkz9/fdHyDhkaKveiB/vivtR3I7vhg0Mc1l8XfzQ3EGIhKpt7tmsiRUae/rmNj3Fxe
 /XY7VHtwx9V4OXpHnDqdB/FoeURQAzMXBZ9Gpc/MKpcRSAaG47twxyUHG+AnV1rIsNl4L+DZ8I3
 sqFpXPB4zE9fUNBK3FkHf8PRZDT14ouCEUOFB0kkGIsWNpOS5nSSEELs8d/nOzl8P18EgYq4v51
 31w4/h/HRiFX53sgJSotlpC/TAJzGufwY7S14Knx3KDhAVp1KIkGbKw3PCAy8vdTDCV4tAjMjuI
 hKGj1RUuAZTBNgKAr4s7YUSS3iEI52HMR0oLi5ibi09OPyZrLC03SFrC83G+eAaFJhgdyPw9q8e
 SQdokwNJGwUgtNbxt6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On Mon, 26 Oct 2026 10:50:37 +0100, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
