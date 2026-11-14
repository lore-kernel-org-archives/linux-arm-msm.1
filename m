Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645036;
	b=AYs2v6UwNrUiBZFzfjxfthaL1VSYI81akru1zMzuGU7qJj7QiLbXpKzSsL7BRVtSGnR/
	 jxuUkkrmzpuhMB3XnYFLsTDMEYFl8ErJtBfv6mo5qcp1PwSDjB51jVZpfOJKMOeHWgzUn
	 0GRKCUyD5o4V5iZQQpgD9Yabhso+phkhMQeEsz45fun/wWDRf/z7/1Ge+3J5w7WHrezmb
	 M7JfNTs/tVT1nkZ8Q0wtbPEulJC8y2nXZ0t9JoYMUtYOe1CgFXEE/RNidZFE9va7XEByb
	 kYjQ/20rmHjcxGaZwDoD3iP3Z8+XMlMMUFcjpRaSPUZCF0tvYxKBcQgcuz5q4JyRACA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
	b=YqiY3AevmliW7zKdStU/l+dzqKaHb02/V4vb3NunDqCNyY4CCf6ayplh+p4sROGmxWhG
	 uwRAqza7VYsn72oA3tPr8FICYQbFZUZ6Hd/XqaVtB8MVaCDO2fxgRbPIZwqR3E6454122
	 2xZEXOO+nKuJgV1hW6DDlWNPNET4B0lgCf1D8cj7QP26xPxnX4Ypx8ZIELvzrYeZv2H4S
	 q1zlKwp65HoHJXp5ruD+HqJbeX9Xz1NEEc5RMn1YeckR+kZhTl+QHDimBRy7pkdJDuRNK
	 Xay3x+qfI66tT5LdhvVV7xgQVEwHikCMrDzB9YBKps8yxIZ8zsPyEk53EvuqSD2R57w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tocbLiPW;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19858606A880
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19858606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tocbLiPW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so14194335e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645034; x=1795249834; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
        b=tocbLiPWz7ToPwlLUt4j3nC0wlhd5a0f/WMe6qNDoYiksejbN6KiVYB3r/nQ3y7vRi
         +P/YyAfi5aEPGSnuaul5LfAtsvSrVNtkSdCVZC7247HwGw/8FusEKtY9sHJGft/jHWL/
         b9PiN/M+pAFCnPtT8zrCdBW8W787JTVvC9gkCM/CnjqLqvJ8KG9Mrazz8GzD/qsm/3Et
         0tLVHQQR+oFgnxqcXFlr36bIRjK5kxhY8CaOsrygmT20GncZPAUocwSKnrMNHo1+EKOA
         xzHtSwaF9zeWsBktj0/bsdKGln21AzboydY0vo85JG5akHgme7Tffts74cHnbwtBEys0
         Qv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645034; x=1795249834;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BY9gGrhDfHOEmb3K6vpfodrup03WQ2q9F2M4gkFNfjw=;
        b=tOG1N40iAjP8gPPfdQ2nIX7vymTZ4EYgvAVuBF8T7eZ/3QN6iKWakZrnjdQgitwlzE
         Z+GhouuCGy9ZaKDagRyzh1rKermwDMhCPkE0L1xOTCZQqYAao954EzTnFZ5IPi6+chJs
         Q7AhVGTc/Cv8bm8Bwjtza7ijOKwWI/8XhEb7h6beZrmh9RZP19bgpE5vi/iM7QJqPQtr
         reVy+JeDMAN4zoLIw50CtUEr8dduD0tx4+C3mkbxY50viq6lamOCnHVRefiRFw9dgqHV
         S9YEniSGmbDYFxAufNsyhWF56QjGrQzZxwk2tivDtxTbHfuqI/fmmMR/pH8hq9zlTj49
         mTbQ==
X-Forwarded-Encrypted: i=1; AL+hErGOKkAhQEq/Rh98CvJIuPF8hoYq5f2wt08vnL/1+lD5NTko2f+nIEWy25Z+NLMkmmghBHs9szXzSKlutzex@vger.kernel.org
X-Gm-Message-State: APuU4Z+vE9kTmpiDrPpEU/bscpw6PQWB2gYHjXVKxHvjNkO3iKB9ZSQZ
	fsHNAsLisDaW6w4LBrr/0dqFe9cjpTNcZhiq/WRalpEEmyCVgBJl5QNV
X-Gm-Gg: AYBFou2ZLuIBbX+ugJxHukESb58RvcBvlJpdQyT0+rK6pzclBuMJz8rD7OrqlJaG7at
	ZI/xImK+Y2SkwO8TO9UW20zRdQ4p3novbTgZ463zXqny1IMf0dueRR/OlMsqra2mzn52iISF+fO
	1XEFq9WCaMGB7F4uMzarGtyqUFRU8GjbrG1lgWszIVEmhdVLAuBGImwOrRPkE02tvjgfF9NtFwV
	WCnCFlmDboPq3fP5elZamsiYyqRnwO2xeZLL7T7R1t1yWdC2wMGKbCCJjCh0+UAvPQH+DUGJRY5
	wC9v/ynlrQ2SQjGrLd7TcfsiQky26eP6/YhBOxariKz3UkoY/r5oPWud6ac2fyOrL4Npilhe7XL
	JMav9d3yk5VFUipdMdarbxIfcEc1q7YWYOtpPinOMDcFfWL4V70RiyBfp8icgF0v8CTybdF6NO2
	zuoE1Sxw+GQiG2HP8APzHNetvODgnTFeBdctE+7rU3/+Pthl7jn1o6moAiB0z/YBqQ+9gZq3gU1
	XOf+JAB849SXUAZ7fp0lJdcZU+n8wFZpmVmwAyZoR1TD9L39V54
X-Received: by 2002:a05:6000:25f1:b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-49c7381a73amr9429791f8f.55.1794645034503;
        Sat, 14 Nov 2026 00:30:34 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:33 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
In-Reply-To: <6ffb6f7ab9794a49a50771d23b3a1e1f@gmail.com>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciAocmV0dXJuaW5nIElSUV9OT05FLAphcyB0aGUgaW50ZXJydXB0IHN0YXR1cyBp
cyBub3QgcmVhZCBvciBjbGVhcmVkIG9uIHRoYXQgcGF0aCksIGluCnByb2JlLCBhbmQgaW4gdGhl
IHJ1bnRpbWUgcmVzdW1lIHBhdGggKHJldHVybmluZyB0aGUgZXJyb3Igd2l0aG91dAp1bm1hc2tp
bmcgdGhlIGxldmVsLWhpZ2ggd2FrZSBJUlEsIHdoaWNoIHdvdWxkIHN0b3JtIHdoaWxlIHRoZSBz
bGF2ZQprZWVwcyBkcml2aW5nIHRoZSBsaW5lKS4KCkZpeGVzOiAwMmVmYjQ5YWE4MDUgKCJzb3Vu
ZHdpcmU6IHFjb206IGFkZCBzdXBwb3J0IGZvciBTb3VuZFdpcmUgY29udHJvbGxlciIpCkZpeGVz
OiA3NGU3OWRhOWZkNDYgKCJzb3VuZHdpcmU6IHFjb206IGFkZCBydW50aW1lIHBtIHN1cHBvcnQi
KQpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvc291bmR3aXJlL3Fjb20uYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvdW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggNmUw
YzVmYjEwZWYuLjYyYTQ0ZjY0ZGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29t
LmMKKysrIGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3Rh
dGljIGlycXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZf
aWQpCiAJdTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKSkKKwkJcmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwg
Y3RybC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZp
bnRyX3N0cyk7CkBAIC0xNjc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAK
LQljbGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5h
YmxlKGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8g
ZW5hYmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5k
ZXYgPSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3
ICsxODA2LDkgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzd3JtX3J1bnRpbWVfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikKIAkJCWRpc2FibGVfaXJxX25vc3luYyhjdHJsLT53YWtlX2ly
cSk7CiAJfQogCi0JY2xrX3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCXJldCA9IGNsa19w
cmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJ
aWYgKGN0cmwtPmNsb2NrX3N0b3Bfbm90X3N1cHBvcnRlZCkgewogCQlyZWluaXRfY29tcGxldGlv
bigmY3RybC0+ZW51bWVyYXRpb24pOwotLSAKMi41NS4wCg==
