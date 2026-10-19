Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297EB4E2F3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409917; cv=none; b=P1RPI+YhVsSHa36EudcU/jGj9geh6DynvwiWPJ2KtGjUDCN0UUJ03w9fYXMPq7nT21w67MQjzmGXVqukyFg9CNJ8RyhVMQ4zLZR3gT7xbm92KN2OQIVZeMP5XD258Jr8ccPJ++4cB61+Px2PXTCPH/V3uZdZW5WXPKNc0uRnjRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409917; c=relaxed/simple;
	bh=QOs3o/03oscCxG01cilEBA+6SNpiI2kfLVpehrEqg/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiMk2V2j2whFYH8jxhhJErhR1McLeBczyLDzl51tLZfqPEZ6+UKvXJdobe5MNKE/4uFL6dvUZAtjMdhHn5KoWr1ys1aEpGEfjoIQhB9GOG7rN61+tMkwCsGlqjADxabpeqvKCqsxruLNFFyn2O2U6OSVS8s2urZ0hw/goN2o3kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inHQGRQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsYmZ0VC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inHQGRQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsYmZ0VC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P19W2042122
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=viCG28a9GrMyDHchBbUccE9n
	1Q9GobJDehgmh2qVkOo=; b=inHQGRQ4nY1ZqOcaxktOu3V6O8YYVWRjNJ0n+99B
	1WBNx16s2n4KqTG+fjvZUpYKd1/SYax5M87hkceZI5HswXLv8qBLlUSIduP4E1JY
	yaCR1uxyGqbjht3Y8o8Fp7Ck83V8zV0mnTK+cjaO1MWw5pNEOXkCySz1k8ySxEvj
	bfbfuVHQm0v219OGpTTk7ZHnG0TkK82PvMB11mB4HeiOdhCNyIfZ4LfdLDJBcsx5
	V5jxtw8cEhPm07BxaN9VdjNnBnh62k0FUZ8C18ee8GjA2z/x81BkjdOAsXpS7HGd
	nSvehQOC3+6N9GjjPwhK681N36Qvo8jHZj/ZB1UlwLWkXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2gwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:38:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so783033185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409914; x=1793014714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viCG28a9GrMyDHchBbUccE9n1Q9GobJDehgmh2qVkOo=;
        b=QsYmZ0VCNERu+UBwQ/+ogJkityK98jcKidh9cHld1JxzUSvjgjDwC8yYbme+acqI4y
         l2Yux9BlfNbYJx7OvFt8zPCyrAQr06X/nvDkGYK0c2H8XPQTy404pj9mGkhutVqQ02Qc
         dSTkWyK33DG1JOpSuFRcYmd8yCtUA5b+ODApkk0U8tuMl0/NSPSdxe++cB342n2STSp+
         RXRCaX9D4gHPWfrVC7CszRIB4R2UTyY+q+Khf9pa3UO1cIaQy+G+cJOnc7SuxoWrzduv
         qqJaUv/8ulFVaIhQji7r34e1MlupsqWA1eV+a8+Z7otNDND6KLBh+bpDIE/HyG07vsgA
         27jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409914; x=1793014714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viCG28a9GrMyDHchBbUccE9n1Q9GobJDehgmh2qVkOo=;
        b=g6zMgoL9mCM+YR+VzeBuT5WCDb8M9na4uCerzboILvf4nBmOy1CSnizCC1sTpW4kXd
         i9WHHTdhvNQjxyUOHCLSh4vHsEloDYqpCq+gERfwCh94ijjZRO6vwRiRDCrd/eqrkDM6
         jMiZuG+9NQt2HR69tcjJtJLGF3O6dE1BZmGISoZLRZIHr2AcK5Z9PccfjqTNyyFt652k
         mP6Somv7z74MhQJ6SBJ1wBkRIvw7e1Ac2MeQ0UxesFC86FZfWebg7ha5JnGc7ebZNOLd
         iZtMyG72fy2nj43wEUpFbJC0WIqYbPVxbydUR5T6o9p3FwlBCgK7NQ7gsyjY3uVNGg3e
         CwGg==
X-Forwarded-Encrypted: i=1; AKwUvBzwZxmF1EhfamSqwRDFX2pqUe3QijcoEzw+f4Z83YKA9fs1qFz05g9Gaw+CjzqGa5A0Ie/jH2LPXzvoWq5l@vger.kernel.org
X-Gm-Message-State: AFq9FYJcCrR5DWYNMvaT4nsVrIM9uPfpevcVboSjnBWNEAZCozoLxUc2
	UHgns/5hRwDhAq9lXhiMbcht2FozJ2LwtDtSxkj2SGDI/H5I+EVJFy0X7c1JpgWUQ3R30E8uyEW
	oPiMQBMumzAAel7GHPV3ITU7TCGW9C5CCfjlRpVXwM6RDo/DVy+ICepRtZTvEbcx/38moB3WClS
	Tq
X-Gm-Gg: AYBFou04eTJwWssZmziv15VTQsIdLcksH1gzu/Q9OFUWe5OVRGbk08Z/gvFP6B1E5t8
	C3CzsxNFsXtlRIz2JgqMe8MgiwfvtSe69m49mUq4ynOmB1rmapK/IKvIb+HRSIO8+5yedHc1Zi6
	/IdALXkgp7gGqC1WgjH3EUecJFmf2prxBq8RlBzAbDiCE/lVli+zEWwanMDyoSNUQdwKXKXQAiH
	hM1sbipQFilUBXo5YRCLs+7TiTStWWNYUp5a9MyMbVaJ3ONefrTUR+pxNuKm9LbRTcXex0jmfdE
	dFkfQ+P+XSxyUdrox6YVAfw0cubxoow6GcKj57ZOkUISkb4JmKY4+ChojOu1mKr7aIAjvh8f31R
	ysaJLs/uVdBEo3qmz
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr1247868985a.54.1792409914262;
        Mon, 19 Oct 2026 04:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr1247864285a.54.1792409913562;
        Mon, 19 Oct 2026 04:38:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503d78sm22148555f8f.50.2026.10.19.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:38:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:38:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
Message-ID: <v4tz3aztvv5cenofrksn2g3amauzq77sk2cakvqoogqbpbmuud@cwdziqxeccyp>
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXy0XbUf7i8DQ0
 dZ+kBbsbxtJOy04htftrwMZh3+36hTvsk9zEz8NDHtaA3V9en3KOBMaTtUxosULr+rJhnNOkEVU
 5Te6qK2I8zPyvAArJAmZSfRaAhrw5ls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX2Xlq2WOB8BPP
 m+KIrFCRlkT5tfQO37lJCmYj8SkHTGXN+WflHuVb0pIA1SQTsKh+YMWGY6xbEysdfrhMCPyt8Zn
 c91Dfja3qmjyLucTy/SeARhL7s3tT/sazwSxbId3qolOUf/il8LGecMA/WPfRBRS7Dn3kck+qAK
 Y8lr22sWGcqG2qRkNxyvBM/X0ggbNW7GmxftjtkgIlLiyCsMNeXXr7hZZWwbkpr0A1WylA7a0+R
 vyBKfhkCJhy7jmqR8dEkknJhhwAik/FQyQ+dd6CzodihoTrnod6ay2YJ0HaollBNlCk5AJLy1Ny
 1pvGYGdgDvn0rmM9K3yrkW8zb2X+o4E0l63dYb3eh2C9F2NK3viZCnKhp3m1kukcntbutP4nrbD
 iW8Gh+w3ayxjU60YpUbavCprq2URMonwtrd/VIE0CQ2IOhLgTQRhUUmGidfgC+5i38XVpNy02tf
 M40ns2Yqwm/lYvKMmDA==
X-Proofpoint-ORIG-GUID: 44fhUjcbca6VjaeRxMzhPlAfZkoFyTmp
X-Proofpoint-GUID: 44fhUjcbca6VjaeRxMzhPlAfZkoFyTmp
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad6013b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_C40RPqcRi3kUEhYcr4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 19:05:04, Jagadeesh Kona wrote:
> Add support for AV1 encoder clock controller (AV1ECC) node on
> Qualcomm Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
