Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500785;
	b=ShT/qibH8WXHYLNna0yjtSiX7ovHx05KrfzjVS95TwyFPqtWwDc4tGwBr0K2pAFH8BKr
	 E0JOfyKwMw3GORmLYwk2fNMw94snkiB8PIZRssTdy7LPm899SSqCgACQ1LRBFugFnV02p
	 XXvXDrkHYH8pppPWYOov4ZreIuiyzhtBOiKxoaLjeFg5YbrB9Dj7wZz0UMLxhlWjCIsPl
	 7CVVKNCkv72UDV6FR1LGpLXchKGFwbL1amywXuuwD43USr1vEeYTPGjGYr5EOLbQ7RQvv
	 c8TLO+CP5NRqKoS3BMOPzkB0ihOcK/7uR/lCrrI4UxeRaLQf3v3ul4rhGwurVF3nLEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
	b=TsSyWZFbIKqQHP4Nq8zQq5Ilx2441XspXfdywmNvK/3t+AwNm1XExVpLM8eOT7NEv1x4
	 Qw4Y4JNKwuZKR12f7Iq04bRjxTI0XUiDdJsIeBE4IYHoKRzZa8X9QR2bHDMqGNRBboEJx
	 ET6Gv7nCSVwV8wQz2H7wgbZea8qXTdUQBGNx6Ti3MkvBHogMstRjMKQdAquK/ArLSmrUn
	 1EZnpXHGZqebAL2h9bwFTiB2qKCJ6TqPM2hVLp5hYglBTuPm7OOjzFe0Rhk8I+NXVgQAf
	 CmlFuoZaPm3cmC0cS/G1I8VudKV6C99MliBWJ6dnbYDvh+3264/xVUEzELCVnp8vItg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FKsBq85/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tc82hPZF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FBB606F41D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FBB606F41D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKsBq85/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tc82hPZF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBYF6W066377
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f9IEdXDKhDYNUZze3bJsmCBN
	6Zr2GWDjTH6URqpvUu0=; b=FKsBq85//g1HI71xUj5krTCWHR8ZQpXIYBuW0tdi
	nWAIKc6OCcMYFrQoPtrI82YYRvN6eLYmyVvtGD5wqag7XK0o+Vk7Y4niJuT8cE+T
	1xLruJ6GdMJatM/6dIhxDL9WQ0akO7cvIbleLscpRG2XalVyUsLqUGva+Qo4jlqu
	r2QsrWuZIbzBWrYtZOtat97aErmKOVDdxCO2ul1v9/QRKoV9EzUH377NbvBp/tr6
	Qa0VWPu4teLOdVZvQn7lhk2+PCgiEOgA1afchK86x5m+nfcHzPWW+XHm90w0MJ7x
	h2Rim1BnSr7yTq9qPIHavLoWX4e15J9GEBXnOIUaUrbzUw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv87tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:53:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b875639ceso67370056d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500782; x=1793105582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
        b=Tc82hPZFTMsMJg29+eXSJL1WPfVg5ElbUjR0wWffZe+5x6RJ/X5qExZ+yxlC24IuzW
         Ftl4uQ02uF1aJY9jD6bLDOFQUxioBIgqVEq8bfuQma4VrEzP3GmFvHTY+gt7LN2uHG4y
         9eCcpuepS7Tm4fatm0YvQTvCIjrFPuKTjePzTKNornzxryfs1vWp21ULFFCnngpTf7jf
         9QAti0lSV9V1mWOaSly8idCelv7qQvF1JojbyRQGj46TP4KxKKmlRC4N53DgLLKRS+VV
         mIiQCYESjBs8qZNBNNS/QT8OF5zcU5j9lYmuey/M9kEBBGsXtqF4nLGmI9w5xGsqK/L7
         dAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500782; x=1793105582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
        b=YMEzM9NNNYy1F6JvfkZ9rBEBNiVzs9WRc+mt2J4YhUzGYSSaT5IQt8gnRCQkpoyWXD
         aUJEbumTA5q1818eB8JQ1DJY8ierpc4Q88nrM89LmTDqg73GhU39/aPMB6OKyjLvIlwN
         frjUUD1JEXkjlE7vnMM2PofihYhWx0yv8zaonzIU87x3BkHSBzuGZ6lIw753OAj1PUr7
         XDiVvqDoATsx0PHpG/nYTUv24GVSZMHW7q+GmoUWwiCbu8P+DyIV9gmbflQHi9cKivsN
         4lEypZ2Qa/YQ7O72r/5Jb79iqPOgZ02IwpT6klwIDkvh/Wmx9pF0QX8KsSl8X71f+Ypa
         9yvQ==
X-Forwarded-Encrypted: i=1; AKwUvByQeFeoT3Y7G82VIVBPCKWlip5KQodWXITpoXg7LObN44hzLxOYYuz739xVKNQSZhsexLf84dSwPweihPTE@vger.kernel.org
X-Gm-Message-State: AFq9FYIsAjBU/tKbcnAcWQT9A6/FtdNYFU/cPSEvX7qy4w6++0PA/OZ2
	8UIMiLk5+tujySuUzbcnKoqeLlG2Cq2LPUJxLb3wr+oIK+VzVqwLW2JZxWOPzk0PRpY9xsiwR6L
	rnOaw7PcFhzVQGnp5rTUgGQsy0l/mPeTi22zVZVOAuZBRsD1pGdnyMFcknHVKrM2tfR04
X-Gm-Gg: AYBFou079k13ezNpr0USqLXG8XhRF9zFHQ47UUtkyDdkdV9UerTtS2aS0ByqxwR10Rd
	H2RJQpWRds76r3crqe4/d3vX+si4gydQkpJHDFN+JKTO2QYKB68hQSE6yMegT3xW9fThkqJl4ZH
	tv8RRwqEk2a6rhGv50Zm/Mg53i9tQG+Z0jjEPrAfB6ilC9YIrxHhftOGEQyGCfFHYq2kDT/LnyC
	cewjOn//ujHtK2anLLtVk4QoRon6U1Fw6VYSVhm7ixk6ToKMxXHPaCrkP2TsgqzVfACJhXcZh/w
	yr8eKgi6J0/ydonBYAI5v63HygrP6L3aX82vvAsp3mhZZjZdLVuONlKYxtnPWGqwUazPJYhRiSy
	0bcCK7Ezr5W3pijcL
X-Received: by 2002:a05:620a:6f82:20b0:93f:2e72:8389 with SMTP id af79cd13be357-93f2e7288eamr1036123585a.54.1792500781933;
        Tue, 20 Oct 2026 05:53:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6f82:20b0:93f:2e72:8389 with SMTP id af79cd13be357-93f2e7288eamr1036120085a.54.1792500781316;
        Tue, 20 Oct 2026 05:53:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce2b8bsm73302245e9.15.2026.10.20.05.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:53:00 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Message-ID: <kfabsthyoza7b4qbkabimkvoa3xhyqvmkburk4vijli7mvj2jg@urhns2imyvxe>
References: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
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
In-Reply-To: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX5XL92gorTGYE
 cPdUFlFLNHSJ45EtOzahJM0h2kK8lDl5akeGU6AEqRYHgkV9LqRExi5VspKtLl3QM7Kpts1XO6c
 MYwf48xseDQP5jnRUriPKz5bA4a94RgPRM8KiskFaj7XqF7nEsMCpreqdRVdb/KjoY+l6TtFoma
 55KUxJWZHNJCqMhZiyTCkfw42kSkSDyqJB7VT6C5WDTzF2ySUZ0fjmH2PWU2zo8YDCih4clF/RX
 pT/gkDUMZAIcFVvKs40+wCuDx3tcHkkLQvlruKQpClM/fdj6cgA0fpVH3fXco4lffIWqNVAspB3
 xRQ/tkIHNHPkXEsQ6bentXXnwdx4Mv8cTYMsY2OrzLMg7v/xDBiVNmYTNqXp3NTYmtOvIN6TK8n
 aZC3O9f7vjvftgLHw5qehR3A2XibmOVUuK8jH7YA3MbJqFM0Z0eg6OzNd8njp0uM7mfKhwbewOR
 45ZfHkO1TdEd9gbLY9w==
X-Proofpoint-ORIG-GUID: mO8rlbqfO7MeLBWMawY_3GAWhiPEvdv0
X-Proofpoint-GUID: mO8rlbqfO7MeLBWMawY_3GAWhiPEvdv0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX2HsDVjVdF1ZR
 SQGFuKkf+gIvfZ5LJrK8VamP+STCtS0R+BBZWrczn1rYiX0j1iqQN688v6RAIB+JnMzteobZIpq
 gWlfsilrba9kpauVFvmAGUpi/BSpspQ=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad7642f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=p-9omTesjESqsTKkUiUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-01 19:19:19, Komal Bajaj wrote:
> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
> TCA9538 and TCA9539 expanders used by EVK boards.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
