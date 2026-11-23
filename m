Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462525;
	b=pWUzUePcnypMd7WhU1uwfcg+PjdRoI+43JEqc9vfDD7RAVQ2+4vr/xl+/R0qjLvAi84x
	 Lvbo901Us3BwkNjLLzlLCa2tFdtK2m4C2s5Or3pD7BO/5uaTXpndcAIzapFWND8yLl5fF
	 3ezshV3eznxNcDchQR5Kij66VdMqw9yTg9iE23er6LA3veAPEeV+rL6yyROZt9gEn5uE2
	 xS36JVzC7y0kKvjYQrekE+7HMRgc/2HMjIxavl7WEPkRDEJL2BaWpaLXWqBrjJDUixJmw
	 +m9YLe6Cus6V6AiglYd3iixuxC1Oea51TF4fdaGj6pRYyuRXj7ppUBxqPxLrWLXIRmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
	b=Mt58VrFAjkwor1UQebAew97gviLWBtguCYCMmaOpuq3hyrxYDfVNv3SMN7HsOGRmHn+W
	 WUhcw8uMiLjv5nz3t4FlZuo3TCF3lL6zvHzrqh5bOz2S0YkXSCnND3y5oYQ9qcdvGLaZb
	 7ZzBvMsU0V6mf1qdn4Gv7kpddE8U8SRhBJ4ZouePpW06TmdNKAHBQDT5tIAoQ6LkU1dq5
	 uzO5g6XLbWI2QZOlwUA3vfDZxvJYMKcNg/yRmSQF0FldRADKWDV81qBUnuaxjPADwweSV
	 ips7KTfPyi5/kzbZ1LwBFlXXQwCMS+Dc/RCEWPVjMuBJCzLcAUQuGXB8d1C8SWX7B4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465F606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3465F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH9n92377537
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74mX4a3vRqZEyTV8MaSaXTpj
	++Dtm74ijLlv0eeiueg=; b=i0kM35MMHabLAbMOP4SVW3ovhIuBCRprPcSdpGRR
	1j1pJ+96IZXsT1MNg5tMrEEZnBOBuXNHWOA6cWZ2mVHyqAqy5902QVXjQuADfDTa
	FjLmZBnM+ld51CWIcT/1sDPHHKSP+DDHeJW57IM+TvaLWsfoseZEfNUtNjAlS+pi
	9jxNWzT5jyZTWr06p4kc2eBME22hGa0ju0stzwpMyY+qY/v7HHcs7Wv8pVBmuyUE
	d2163ZYt8oynYY6rPHZt0b8nAIkCVBOU1XqCtJ6H2H6J7bBLeraUaV+EuSmPY2p/
	ODrGLBWyO46RnmhEkLlUo1ai/Ca+7RkDRriy1Okd5fVvpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut3kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so772929585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462523; x=1796067323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=evuPWXBg2S1HDs02kVAFSafa1UPDJ/qwUXhXw4tcKqyhkg5WJz+fJ9pxPHc/oXbUUa
         QeyVeMnGivjh87mhEFVW16GXiiTEns6O2+61ZSlsQiCKTu1M8MUm/QtcAOpj8f9fgsbC
         tSQvql/i9k8TOGkxuZZCMmig4n47F67fYOTO7eeLA53Nh3ZVaCgPm7lVOzgPoi8LihK8
         S3cXpxzm0L8jjgQzmL44gLOI+59swUHL3dg/6wvBV5waJaLKp0M0Gi2AcLClC8+5/UJP
         xNgaX8iGcxnpdDKoZiHe3IyJlFXDY2wjIPtPcolCB+AAuNO0X0PrwR0f4sQenwuzmyAN
         sEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462523; x=1796067323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=W55CNzuDIOl0pcZ1T6CntFwgo++6B7JYLFM/812INdrc4VWjMY5tVVPsQY6Z82DmRs
         UKEyFSEUvk3+cC0gCjBz0ii2D1w7zou5KmEr8ezYw2KFR+yx0pDSnNlWj1dzVyClGxTz
         F7zHPGAapv8yirTJR8qa4WaLrvwKYDgWf7XJB4rJtVvRvtdMmnY+0sCBBqhfexIN4KhV
         z23DbezaqL33s5VXmBxs67lytc43GdoiqxeaaQcKjFsn6HnGasFbzCF76Ib+zxkgB/Gz
         Fy+uorTtGBM/xF9+QXANS1ixxissblC3zyvzINZaxwHWGqtKMNG4+pfExw3u03cpt6sP
         0csA==
X-Forwarded-Encrypted: i=1; AL+hErF+BJFZggUQyLvxjjMszkInxDPNBWj3ufV4qpH3G6iY1BsczK75o3FOgevisyzcQI6cWSx7f0gpxmlDvGUl@vger.kernel.org
X-Gm-Message-State: APuU4Z9YyQPGygWNyG5QwrT/VSZ2Utu4ENVMlB7VC2Bd4MH+6EwHbHx1
	ehTLho7exHCn9ys/RJfYODtcZX7A+T5qxbC2b0XBAcSTvGM2TltiaDJ434LKyatIdXbmV325aXC
	BKYd8Y0nrJvBIuSX9m4MAMeOfKMK1x+8xx2u8QiPceW6YzRfI6r5NtdYP6Ee4Kl2MMlrW
X-Gm-Gg: AZFdTZfZORdTcRIN1lGX3FtWluCqAtMX1hRNsYqJojrzlQftRUz2IWqgy30jIR0xHOk
	MPltg2Tq8QZU8qxv4Q7SD5SWkKoiTNcF9ZE40n5SU7959pUHpeNjtwxuW9CcWxtN86m+MjflD34
	O9s8Jo5Y0jArcxKVxg7P7RPfrr6io6qWRfz+qidZ09rhDOkIt3IYXFvx9wEFSpz7JCp2HVOecs3
	fD9FtI+zJE3tQMPOqeOoCox03qmbTOwxP715PzIMd4x/0K8vg4L+TZhPcPDjD6qgqmfCTNlCcVn
	zG6M81dNYkuFR4HIW/tYUx0vD3hrdYxP4gmCpbDn2L0773iCW1OsY+kiaUk/9XB4762ZCR/0GbK
	8rRNxzaK1mtFiI1eZaXy4k/Lw8vtj8S2JPctFV3l45RKOeFihyqKOBscdwiZWwD4J
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134933385a.8.1795462523292;
        Mon, 23 Nov 2026 11:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134926885a.8.1795462522682;
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm184963885e9.3.2026.11.23.11.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: Re: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
Message-ID: <6ps6o4mexhrbmcodgl3yze2pobq2vzao4lrbhqomhrc2vbfjb4@zmuby52sku6s>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: J4rvMixEDYFFGHAbDqhgDupvp5cgPQyz
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04957c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IQcQmC8h3zhotARXj3UA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: J4rvMixEDYFFGHAbDqhgDupvp5cgPQyz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX4niKRnmaiYnB
 CeOIMal13TJegDOGuWAtws95OWXtmGY/PYLD7MfHSB4yMLuzRPB4V1hJy2a7KBXFnlWIs4NUVfv
 lg1ekK+6jmMMgE49gaOjvx9pFxbfT3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXz6XUAxTely/V
 htEH/uZkS3SEoebZqSBcbeAySRL4XLnHFmTR3obtt8bDRkeYbQs3uC0/8PCVZCL4QTmYRACQSXK
 vnvB0eG3sslGEGFxfoBZXWkuAlFnnqd6GkzmfPS3O7c1mpwHIPLRog5bz5eqFGQC5on2cdJfFsg
 AqLsjxoaJP53fQOSux0p9K0KvhTGz6GeaDJP+MpvfcMSoNu4oDcUccL71BRWsn1amiDSKJf/s4q
 TuOIIjs9ryhK9ZQ47Vxxy5TMHKAENQKNACzb44Uf5hRFDePPtop2Ib/ZjGK+EVNo1CxmQGtxBu6
 Uk47zr03Fsf6tNV19KKHSOQh2pvrTF34clC4C9swJIVNceUzU5lKguVGbTB05a1pJSKij8Wb2/R
 1gtWXA7XpHxhkMuBZqHoTM3Xu+Y88JCMJ6CG80aT+5jWAKf1jxaeqDMjm0EYUfLAE8WP7ZOQKUw
 hGOwMi0o3zLZXH0QWig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-22 16:14:35, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on both WSA (left) and WSA2 (right)
> buses on the same WSA Playback link. One MM1 playback open brings up
> both chains via the machine driver's multi_direction_codecs flag; the
> SP<->SP_VI control link in the topology handles the DSP-side pairing.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
