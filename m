Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261779;
	b=Qoi4B3dCrQlDoXQ3EB1GSFIbh+qrWfw5g8b1cUkpsX0qCsDnX8IVtXCtEb0XCucGhXuH
	 essg09Ztcs2bbxkGzDFsxEl+6tiWWDAsHcQKjq0PFpf9WmU5vdnAx8BqtA5Bmkg7+VXHd
	 SsNdRUP5pVU0HEw1QLs9t3f3wITH0rnm9jNhPheAjNpozzpUGvQpQtQLn2bRqUd0r1J4Z
	 blxXvUVCBRrJKnaSpY+cUWbufbl20qNDHkrT9fCrnWSZ7gzJ+PmirZorLyw4nE+KW0AFT
	 N/hj2nbXZMcSxAGOGTyol+8KczCSdKTYCN4VfoF+ZQHI81Chp3CBGEdysOOpQvRMfGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
	b=lCjLQHjwEYJdDXlDvTSQ83uRwNFpg1cX0FvXKIMFZjsc1QeKApOz41TRWUpqPrkauXr9
	 dHJwsKS0xke4jAjpqNjQJ4yrdlzIkRHRefsVMHLJfsbyfERtduD94qKryCX1YhGeyib55
	 v+1tTSHNcHWI3LxQKUbstsif/Cd7ic5vkjTm7RKS4Z4As5tPod+loNPnsvsEMj2G36Y0T
	 N9no3WZg98jRwEqevBL0QP/4nJI2Aw0OXa26AuwCUnKacpnBf73j+LmJCOs5IyfuU9WkW
	 m8AYQYlxOx0D18QUtGI88k/yU1mjt++o6twUlMidgm3bxjdlwkgjdb8E7SYoXDwejUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiF17yli;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCK4JOX5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D6C606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 22:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D6C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiF17yli;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCK4JOX5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LEXK8317322
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 22:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AD5fB8OYC8HR6TpcbWLlkKIK
	ZuUu5fuArtYqdnpv+5o=; b=JiF17yliFGrBffx23Bs8PotLT983x4SWY/TK0qrN
	iBZOZ8JpCAq7Iql5wQt4ScXtv5fHXk1Q5ve3RUz0KmYYH375IJwId7BUNwGePw2E
	po+iTMaF9lQmuvgs0bFRt2VVeqzvAnvasVGkhud3WdFZPtnFfvrR8wyMxH5yFuch
	maZsfPLO0JlsnBlPqPRC1Ay8cBIK64ZQRHwDncJa1qJEONRE8MJFDOZl1HEzKnGn
	FnBDhZMlmpSLjsTKAIwruz5D4Anv83eCY+Mc7tGwGTh83eYC+JZSzIPQxiHHO6Le
	5vrwcoyxv0obwy//+vU8/S5Xl31YlnroC1O2y9wygy0eCA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkg5t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 22:02:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecd2447f4cso421737e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261777; x=1794866577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
        b=OCK4JOX5AQuIMfmo6ZhNfcqpK5eHnWguZzoVm6Ej3Tp6K/DPF2fWKs6tD65mkwsTZt
         tQoz8F0/j8SeaArJemrkLlSiyratZpsCiv91Zgg7miCu/iqcUqBB3PJZ5p5ru/j1yR3K
         kZ2fP/rYxc21NIGniyzFZIj5GAIS0AEdBwuIooj46UeOpfBs2o7wDZrmFh+Evvwhvya/
         DVKuJSziP+DnztXWdmddxqB4mM3inlQqWpRZKY0qxXXwmPbAXVUhki2SNdUmiWtq0JkM
         5fnMOsgygUWRJPafc9VJayj4MW82ldZPJWBAVALBF9WGFiQ5hF5bduLR2Jyd/hIcLNQW
         TdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261777; x=1794866577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AD5fB8OYC8HR6TpcbWLlkKIKZuUu5fuArtYqdnpv+5o=;
        b=FzMQ1+8P5ZUa5aJSINmQUcT/Rnivz4ZcMnnuypsvY8IVoEEXglh87bzvZ49Dnax36j
         BtS3R8kUrKSAkGCVTogivOhsXYu9B4N5XGmeXpGvHXtW2RxhBhlA5Oux/S2vbByOHcut
         V8RnQMmu+CSceEidIGl/tnqSyAo9antGrLKYpMFuQUuJe7rliFMnIPLNpt6cvoViUX91
         RpmTTqHSdLBjWBuX+1BZyVQfV9Y8Ujm6BYkfAJ29Mf+tOvMK5rbOtyTR/I7aK46j4hF/
         g66yUGcZxqc1xEK721xxSTnlEdMNAf52FnBwxr0x42gUB3LySjRXXFCuku3sNRFg7cAe
         A7Nw==
X-Forwarded-Encrypted: i=1; AL+hErF+WAvmfdi7gN/b9byXl5h1u2x88r9oVEmN8pfcKl++MsQ+JaRcX7bRLS7nx3Q7O1LUedIVmDZ4xAVqybnl@vger.kernel.org
X-Gm-Message-State: APuU4Z88kS2SueOIIZ7k0ARzCu8i5Ey4aBwqMnDBfv2xKhfQhfWHlBMS
	4geCvhmKXI5es3vi7dvB+OmjVD2HhB2xal6HqamAIOuDPsQ67kfA5ukJAosq9tMTGMfj0xiDdv/
	6Ff+gnvQDtFsg55eRdeTaqZKQ8rmymrkWDe7C3nZt5YM/avz0qesrQxljYAQBAw0gBLjd
X-Gm-Gg: AYBFou2ditYdzR2tUF6mNT0z2G3id/DJf9FrUxGoyZeg4x8CqBqqkKNmVo/jFSE51g5
	2hWNpp+7cDemkNc/O0HkAR9DaA9w3j8PF3dAhC6bBEpP1fbX6G6TWSWLN8IBNOvheUj4P+pN86a
	PVgsHrb+bYyLw1FgWHf6qlKMaI7d9hTZGRsJGEz8Eoaexi6ZwUk6FKLR92M9sNk1fpkNXWurWji
	wlKSxZVmIUKveWExRa1a5KZdKiNriPDrSsOjCIrSeoeXucB1jdxkKLe1eBJB1ui1SxadizvmWdH
	af0mA4BwO9XhAnyggrpmO1gp9gdimQqZ8cTdadmLSbE210oHZNJZ2OIPBWppdH8wzUTroata1Ac
	fjcXPlsxPUfEMUYWKSdujqKDm1e4Mcq2DLWpfsUJsKIdOo3LWcm6UbOPp4ieXht9p
X-Received: by 2002:a05:6122:1313:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ee0d1a2b45mr181665e0c.20.1794261776754;
        Mon, 09 Nov 2026 14:02:56 -0800 (PST)
X-Received: by 2002:a05:6122:1313:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ee0d1a2b45mr181629e0c.20.1794261776020;
        Mon, 09 Nov 2026 14:02:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c835fcsm1162965f8f.59.2026.11.09.14.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:02:54 -0800 (PST)
Date: Tue, 10 Nov 2026 00:02:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
Message-ID: <hhmszf223l4uz2x76rqlu5quefgigaowwsuesmfmuzsdl7epe6@hssfeonsacru>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
 <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
 <0c75e1b8-db5b-4512-9aa7-f0cb84606ce5@kernel.org>
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
In-Reply-To: <0c75e1b8-db5b-4512-9aa7-f0cb84606ce5@kernel.org>
X-Proofpoint-GUID: LPikaEqp5pknPwBjGr2GHoPcnqTiYMvZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX09ZZZHHmmfYb
 Pf2zNXfR/IDbj7uA2EAwjt3NEbUBsqdmdfAGqfMVJb4UEooXfsT+ePgYcLHyXF5mMiA0/skU1ZL
 AdtU+Ck1dbpcTKXK/ylj6QVvGebhUTc=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af24311 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=YC2Dopf-cczdmvoT8fEA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: LPikaEqp5pknPwBjGr2GHoPcnqTiYMvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX7gpH2gWZC8as
 smfasrFrLoDgs0QYH1FNeRg0CJr2XtSOswvjUAxLH1omvoCBsUwxODO2TUDboOuQmiXBfK5PSgE
 Ijp3bdWGaKR7kMfUZg1xIDz3Ggn2pE11M8Sz06kZfB/jr9MIN+C73XNgda32lXyM0L22dkz+psn
 MnDuQzFLx7FrOxV3rjipsqS8LVhOiEAgn/Gibo6HqJtU+VaPbqO9nonIfqsj02GDryg6HavuJy3
 9NgOrn+gG7FcyZQUCLtLkmCnKOqBZqx4WEEcW1xvGhwBjq7XxTwo746HvZcPqOwcNUelloPCVqL
 ldah5OwkaWI/ti1t5cG6gnm5r4GrF6fTE876XKLe6ZDT+syYA0d7J76x9523KvAfFBGAAOJs3Fd
 K5Ws7wVGQw/yvjGREzwlYn2hVWbUQVyp+ol1Tpn3S9gfx6bEFWzwsuUOjlNPi6HsQuscnDjEith
 4N8txU2lgq3FYCU8GwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090087

On 26-11-09 16:14:57, Hans de Goede wrote:
> Hi Abel,
> 
> On 9-Nov-26 15:52, Hans de Goede wrote:
> 
> <snip>
> 
> > For easier review by you I've split the improvements into 4 patches (attached):
> 
> <snip>
> 
> > 4: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
> > really just checks for the original (gen6) support vs gen7 support
> > drop the bools and directly check which variant ec->variant points
> > at instead.
> 
> I accidentally left some debug code in patch 4, attached is a new version.
> 
> 
> <snip>
> 
> > So about these differences:
> > 
> > 1: For the spk / mic mute LEDs, on a hunch I tried using std LED controls
> > with a LED idx/id of 15 for the spk mute LED and that also works.
> > 
> > I did not find either way (REG_AUD vs REG_LED) for the spk mute LED in
> > the DSDT, instead the DSDT ends up sending an ACPI notify event, relying
> > on some windows driver to handle this.
> > 
> > How did you find that REG_AUD still works, did you just try the gen 6
> > method ?
> > 
> > 2: For the kbd backlight, again the DSDT ends up sending an ACPI notify event
> > and does not access the EC itself at all.
> > 
> > How did you find that T14S_EC_REG_KBD_BL1 also works on gen 7?
> 
> One more remark about the kbd-backlight the new mode which reports itself
> as brightness 3 is an auto mode with brightness 2, but it turns off
> the backlight after not using the keyboard for a while (and back on again
> on the next keypress).

Thanks for the pointer. I'll keep it clamped to 2 for now.

Abel
