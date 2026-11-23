Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462550;
	b=zVQKwYM0Bic/En84uGeBjNBn/FMK3GtPivCf+ci9gA6Hf0JXuA1NJtE8gY4kcsqilf5M
	 09XbkpiAFKV1qVUinWRNl+7MuM09RjUb7HNrjD6OmRo9+L68895HY9zLi/aNE/0PYwkup
	 CL/TKEsUdTiG6/MUs/64g+moEenlifis5fdkhMdFNvNf8OoypIE9md2/jXvuogQedlszR
	 qSQKfMMjUWu7xbtTdY0+WKqEFrUHYTWHve4AdKAoZ6v1+AxDki0YfdTZR1XKKKEfLpnYE
	 ec1MML/f4Jk631REMRE0OAbzV6X90xplsEMCs1uBKmqhMRRRcN8xzfAD1l0uzOi0yaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
	b=FvxRy0o5kZZyMvOVI7RwDnPwRdsKGn8+Pg1zVB3z+7DVRB3NJ7329jIsr1rxXisXGHWW
	 CwKE4T0vrW53yBbR6aClkHjq/UlyN8wjDm017tna1X/6ykv28CBq9SwveCdN0C3FDIato
	 eD9c/h6ngLs/Pt+8EoexpK5/o40eSXqeNfqaY+DBlSMjq6sTTgTq6o0FSOr/Bzo0bsvbU
	 pC0g7ubRkVpyRcb4pirIKi0qPCWjhaKDsfDaZH1t4w0svu4wBsULOWFbkNJrqBablkMCr
	 6SHGTLTqWVla+9MqDYqDs6m+Sw29wgfAioJsUvqG/Sgemh/B4LoHuhQtmHvtQ6EVMzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbW++9hU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNvIce9Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35C606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D35C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbW++9hU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNvIce9Y
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGqgo846515
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ATnvF+h260FN8MLJBDwPRObd
	JGnZLhXg2pCZXyHXGbU=; b=mbW++9hUY1fsY0j9H3BpmGB5uG0rq0SXmEcrKWuU
	Wf9JYPwsuvAOK+PxMP6Kj2JzDlPg7DrlLg3lK/QuOAv9ufsKe7D8kb/iiU84RafK
	GSX5Q0Ia8SGbmeXx3kecdW1ekt4nqx4aRfQ+q6Ge0Sv8wg0d2IvUmt4xfT2tXbAF
	mSkuTfXYcLzvmpC3cXl55FdIZPo9mD2KRqL11bK3xKGobnxx7UQMisoVFgHnWfuo
	kdDF85Ike6zWOL22+nXTEQ0adUvll+OdKsjQ5hIHBayH1Iyr0+e7mRYxHiHSZ2UX
	Gvj2jesB0GjQyyjsoXYd+71GxaWKkfvx67aV9VXllJO/NQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7435gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:35:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so598862185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462548; x=1796067348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
        b=FNvIce9Y9kl4KucMgjkVaUy16fyeRO9AkJnYoQ2f3mbyc16DaSBE4X0716+/GTPnZE
         MX230URmWf1ItEIC+95VmNbh1gpJXUw52WGNRPLPwnYTUJbF38aNYluAhr7RyhLNtCMu
         0zNk1MaE9wlgXjWvifuDUzlG28NC3v4tObJ+1LccpSS50pGJAZbvEj3vItTXnFKW3yca
         Xg8gtug1KEyef04U6Fp6oZxzQ18oT7BSqx6DVJHXgqoVKet+/kVNTJeVe6Iv/MSSHOcA
         vF9nDyuAfZ5Q579Jaadp53XlVjgCiEIQTp8W7fd6kTnuy2Me/Muv/X0woVwJxWIv2Wi5
         /urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462548; x=1796067348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATnvF+h260FN8MLJBDwPRObdJGnZLhXg2pCZXyHXGbU=;
        b=IMQSJQwOdOp82e+UXkx3wUyyNdjNgUoh/InZT8tQeqhxEFOLUht+VODx/zsaNvDHZf
         x61ZXjk1jNp0w0+3HE4kf28g5v528kti9miPKUfzuSjV3pM9mliBPKWzcdW4gwSV609S
         RIauDO25Qu4L+lWkjACBA+dJD3XmZxjq14iQNifSWMa1YUD5rc9FrlZkjUnczUAzaFmB
         rheJnlnmHcKOWf4EcTvaX4At0/i/1Gbot0ftSpuNuPohUtOx3I2TZRtAEqDYWMSwhCU8
         Lf+asTTrtcAHwy23uz5TFJVDtVjq48x640a8cls+RbT8lhy+9v7jXDB+cfQTbl3dcts6
         d0KQ==
X-Forwarded-Encrypted: i=1; AL+hErHnEaoR/bbhPSG4U1kqJokF/pG4M+i/uQ3hqmbWjogiRQw2X40JbwH+cXj4l9SpBaBY93+I9Mix/EKO0uQC@vger.kernel.org
X-Gm-Message-State: APuU4Z8ihCwAMUkGeEfznJ7NWRCPS2zpICDlhcSdfo28m7ERbigeJc+A
	Kr/G5V7Oj6+iQ9FvLDzg5z6LhGDmzs+GxggV1Ucj/dSWk0OAsqgEC9TgfCtYhJc5ZENvsJuZPW4
	PZPv8UX/GWnBrOFMucWA/9ZXl1DEouJd1aRMJ8tMaOIOahiu3eBunHoyIrfS1BC7GW3oO
X-Gm-Gg: AZFdTZc8kx/arevMwxNmAqtfUZNsgTORN+xDqli8VeY/1TLniyP3MjbSlQuuenIQaKg
	VcShYlO9KLvF93Cn9iGQ+Jk9/JC0oRoYSwpLmWDlRpJB9v8dgteBG3jIY1pbe+nkJrESazmaZpq
	WUG0BQpFfk+wz0D7x81tShXRmPYvvG44mSTb5THsUJegIzlFE6I5otbYP2znNs+5/1kmvkNXeV+
	6CEcQ0cetzF+pj4Aj+rLpMnHHvmcJxWNkPukzGMm5r27lP0+jXdeXM5fRjoJXTK//624VtI/pSZ
	1dUS8cwsSDNx2gm5lRcbwxGs809Ca90TJsoAs3BNhVTxIz1/GAdBsqvOUFB5nC7OgYbrZC3SCeE
	tm80CHItzlNWS4LBgPodfaqi6MNHBIOha658Pz6Kl2Xsr1e2DMPQ6VN2i1PEUCp4p
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id af79cd13be357-949ba965bdamr2368360185a.26.1795462548323;
        Mon, 23 Nov 2026 11:35:48 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id af79cd13be357-949ba965bdamr2368353185a.26.1795462547715;
        Mon, 23 Nov 2026 11:35:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm693167355e9.4.2026.11.23.11.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:44 +0200
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker
 protection VI feedback
Message-ID: <cqt5tjq4n3tezxy7qtqrnkthykx7hjocp3lxcxujkedqjaimi2@6wth3npbs5zu>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: Pt3OT-TC6lR0X_C0U-s74ArWQgmtWc2G
X-Proofpoint-ORIG-GUID: Pt3OT-TC6lR0X_C0U-s74ArWQgmtWc2G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4Tq+5RLDSr6s
 xfYkkeC/feKWIBDGHWN6TvhxIVxxYm8RPYByTxa/ldVLVqJFGgWZh8oE2Glpzfl49quz+36x3Ys
 fGtbzc7t6zSxUT/k0jHGVhiqhh3iugY=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049595 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mYPpENzYAmZ0sQmgenMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5XX7UwfbXQct
 nqcFHqjWx969rhAHF4zSna0Ps2F5fn86A4h9u3j6/zAar+efBhtntxVvjw3WXb9uGSMcrO05+Ez
 Tud8KvKrmpIL3QHQNeLe1KNlf0nlJqWzMaLD8AkyJrsn3EIbyt873+zXIQ8HnuDrQb394HL084Y
 1ys7axkde/25R7431YWOd3YRkyAzBNajb7VYRwSyQSyyU5jv+p+87ku+ZLX68yFbptb8l5dcXca
 +ANcE1UAzH1AqgpQKgVwdviqjCh3YLyy8jmd2G4byLCSabLGP9sPZFaX+bBlrjzJzGKtNZwjXCN
 0s/FHfDYM1BgjzodD14Rq+kmUS6+YxRW8IJ5WgckXDD+OMwnILuUd715b2zWd2vsBhAFrC8ZiOB
 ryambsh9rp0l7aIXu8lXWbF548FIZSSNpGeFumE48E5ZYZvjXY/E/bj0U5BWFFnxElCmZIatb0X
 HfwRN9lWX6A9uEYTRuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-22 16:14:36, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on the same WSA Playback link. One
> MM1 playback open brings up both chains via the machine driver's
> multi_direction_codecs flag; the SP<->SP_VI control link in the
> topology handles the DSP-side pairing.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
